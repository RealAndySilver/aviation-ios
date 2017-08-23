//
//  ServerCommunicator.m
//  WebConsumer
//
//  Created by Andres Abril on 19/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ServerCommunicator.h"
#import "IAmCoder.h"
#define SOAPENDPOINT @"http://app.sinte.co:8383/WS_SICCA/SOAPConsultasGenerales?wsdl"
#define RESTENDPOINT @"http://app.sinte.co:8383/WS_SICCA/REST"
//#define RESTENDPOINT @"http://192.168.2.34:8383/WS_SICCA/REST"
@implementation ServerCommunicator
@synthesize tag,delegate;
-(id)init {
    self = [super init];
    if (self)
    {
        tag = 0;
    }
    return self;
}
#pragma mark - SOAP Services
-(void)callSOAPServerWithMethod:(NSString *)method andParameter:(NSString *)parameter{
    NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
                             "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:ns=\"http://apps.sinte.co/app/service/\"\n"
                             "xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\"\n"
                             "xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n"
                             "xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\">\n"
                             "<soapenv:Header/>\n"
                             "<soapenv:Body>\n"
                             "<ns2:%@ xmlns:ns2=\"http://soap.ws.sinte.co/\">\n"
                             "%@\n"
                             "</ns2:%@>\n"
                             "</soapenv:Body>\n"
                             "</soapenv:Envelope>\n",method,parameter,method];
    
    NSString *soapAction=[NSString stringWithFormat:@"http://soap.ws.sinte.co/%@",method];
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",SOAPENDPOINT]];
	NSMutableURLRequest *theRequest = [self getHeaderForUrl:url];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue: soapAction forHTTPHeaderField:@"SOAPAction"];
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];

    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultConfigObject
                                                                 delegate:nil
                                                            delegateQueue:[NSOperationQueue mainQueue]];
    //NSLog(@"In %@ body : %@",url, [[NSString alloc]initWithData:theRequest.HTTPBody encoding:NSUTF8StringEncoding]);
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithRequest:theRequest
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                                                        if(error == nil){
                                                            NSString *theXML = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
                                                            NSString *startTag = @"<return>";
                                                            NSString *endTag = @"</return>";
                                                            NSString *responseString;
                                                            NSScanner *scanner = [[NSScanner alloc] initWithString:theXML];
                                                            [scanner scanUpToString:startTag intoString:nil];
                                                            
                                                            if ([scanner isAtEnd]) {
                                                                [self.delegate serverError:nil withMethodName:method];
                                                                return ;
                                                            }
                                                            else{
                                                                scanner.scanLocation += [startTag length];
                                                            }
                                                            [scanner scanUpToString:endTag intoString:&responseString];
                                                            
                                                            responseString = [[self trimNullsFromString:responseString] stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
                                                            //NSLog(@"Response String received: %@",responseString);

                                                            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:[responseString dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
                                                            
                                                            //NSLog(@"[ServerCommunicator] CallServer received: %@",dictionary);
                                                            [self.delegate receivedDataFromServer:dictionary
                                                                                   withMethodName:method];
                                                        }
                                                        else{
                                                            NSLog(@"[ServerCommunicator] Server Error: %@",error);
                                                            [self.delegate serverError:error withMethodName:method];
                                                        }
                                                    }];
    [dataTask resume];
}
#pragma mark - RESTful Services
-(void)callRESTServerWithGETMethod:(NSString*)method andParameter:(NSString*)parameter endpoint:(NSString*)endpoint{
    FileSaver *file = [[FileSaver alloc] init];
    NSString *restendpoint = [[file getDictionary:@"EndpointInfo"] objectForKey:@"url"];
    
    //NSLog(@"RESTENDPOINT %@",restendpoint);
    parameter=[parameter stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    parameter=[parameter stringByExpandingTildeInPath];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@/%@%@",restendpoint,endpoint,method,parameter]];
    NSMutableURLRequest *theRequest = [self getHeaderForUrl:url];
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultConfigObject
                                                                 delegate:nil
                                                            delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithRequest:theRequest
                                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                                                            if(error == nil){
                                                                
                                                                NSString *responseString = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
                                                                responseString = [self trimNullsFromString:responseString];
                                                                
                                                                NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:[responseString dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
                                                                //NSLog(@"%@",responseString);
                                                                [self.delegate receivedDataFromServer:dictionary
                                                                                       withMethodName:method];
                                                            }
                                                            else{
                                                                [self.delegate serverError:error withMethodName:method];
                                                            }
                                                        }];
    [dataTask resume];
}
-(void)callRESTServerWithPOSTMethod:(NSString *)method andParameter:(NSString *)parameter endpoint:(NSString*)endpoint{
    FileSaver *file = [[FileSaver alloc] init];
    NSString *restendpoint = [[file getDictionary:@"EndpointInfo"] objectForKey:@"url"];
    
    parameter=[parameter stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //parameter=[parameter stringByExpandingTildeInPath];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@/%@",restendpoint,endpoint,method]];
    NSMutableURLRequest *theRequest = [self getHeaderForUrl:url];
    //[theRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [theRequest setHTTPMethod:@"POST"];
    NSData *data=[NSData dataWithBytes:[parameter UTF8String] length:[parameter length]];
    [theRequest setHTTPBody: data];
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultConfigObject
                                                                 delegate:nil
                                                            delegateQueue:[NSOperationQueue mainQueue]];

    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithRequest:theRequest
                                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                                                            if(error == nil){
                                                                
                                                                NSString *responseString = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
                                                                NSLog(@"String: %@",responseString);
                                                                responseString = [self trimNullsFromString:responseString];
                                                                
                                                                NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:[responseString dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
                                                                [self.delegate receivedDataFromServer:dictionary
                                                                                       withMethodName:method];
                                                            }
                                                            else{
                                                                [self.delegate serverError:error withMethodName:method];
                                                            }
                                                        }];
    [dataTask resume];
}
#pragma mark - http header
-(NSMutableURLRequest*)getHeaderForUrl:(NSURL*)url{
    NSString *key=@"lop+2dzuioa/000mojijiaop";
    NSString *time=[IAmCoder dateString];
    NSString *encoded=[NSString stringWithFormat:@"%@",[IAmCoder sha256:[NSString stringWithFormat:@"%@%@",key,time]]];
	NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest setValue:@"application/json" forHTTPHeaderField:@"accept"];
    [theRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [theRequest setValue:[NSString stringWithFormat:@"%@",[IAmCoder base64String:key]] forHTTPHeaderField:@"C99-RSA"];
    [theRequest setValue:[NSString stringWithFormat:@"%@",[IAmCoder base64String:time]] forHTTPHeaderField:@"SSL"];
    [theRequest setValue:encoded forHTTPHeaderField:@"token"];
    //NSLog(@"Header %@\nTime %@",theRequest.allHTTPHeaderFields,time);
    return theRequest;
}

#pragma mark - Null Trimmer
-(NSString*)trimNullsFromString:(NSString*)string{
    NSString * responseString = [string stringByReplacingOccurrencesOfString:@"null" withString:@"\"\""];
    return responseString;
}
@end
