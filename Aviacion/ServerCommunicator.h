//
//  ServerCommunicator.h
//  WebConsumer
//
//  Created by Andres Abril on 19/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FileSaver.h"
@protocol ServerCommunicatorDelegate
@optional
-(void)receivedDataFromServer:(NSDictionary*)dictionary withMethodName:(NSString*)methodName;
-(void)serverError:(NSError*)error withMethodName:(NSString*)method;
@end
@interface ServerCommunicator : NSObject<UITextFieldDelegate,NSXMLParserDelegate,UIApplicationDelegate>{
}
@property int tag;
@property (nonatomic,retain) id<ServerCommunicatorDelegate> delegate;

-(void)callSOAPServerWithMethod:(NSString*)method andParameter:(NSString*)parameter;
-(void)callRESTServerWithPOSTMethod:(NSString *)method andParameter:(NSString *)parameter options:(NSString*)options;
-(void)callRESTServerWithGETMethod:(NSString*)method andParameter:(NSString*)parameter;
@end
