//
//  FileSaver.m
//
//  Created by Andres Abril on 27/08/15.
//  Copyright (c) 2015 Andres Abril. All rights reserved.
//

#import "ListSaver.h"
#define DATAFILENAME @"list.plist"

@implementation ListSaver
-(id) init{
    if ((self = [super init])) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *Path = [paths objectAtIndex:0];
        //NSString *Path = [[NSBundle mainBundle] bundlePath];
        NSString *DataPath = [Path stringByAppendingPathComponent:DATAFILENAME];
        NSDictionary *tempDict = [[NSDictionary alloc] initWithContentsOfFile:DataPath];
        
        if (!tempDict) {
            tempDict = [[NSDictionary alloc] init];
        }
        datos = tempDict;
    }
    return self;
}
-(BOOL)guardar{
    NSData *xmlData;
    //NSString *error;
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *Path = [paths objectAtIndex:0];
    //NSString *Path = [[NSBundle mainBundle] bundlePath];
    //NSLog(@"guardar %@",datosConf);
    NSString *DataPath = [Path stringByAppendingPathComponent:DATAFILENAME];
    //xmlData = [NSPropertyListSerialization dataFromPropertyList:datos format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    xmlData = [NSPropertyListSerialization dataWithPropertyList:datos format:NSPropertyListXMLFormat_v1_0 options:0 error:&error];
    if (xmlData) {
        [xmlData writeToFile:DataPath atomically:YES];
        return YES;
    } else {
        NSLog(@"Error writing plist to file '%s', error = '%@'", [DataPath UTF8String], [NSString stringWithFormat:@"%@",error]);
        return NO;
    }
}

-(NSDictionary*)getDictionary:(NSString*)key{
    return [datos objectForKey:key];
}
-(void)setDictionary:(NSDictionary*)dictionary withKey:(NSString*)key{
    NSMutableDictionary *newData = [datos mutableCopy];
    [newData setObject:dictionary forKey:key];
    datos = newData;
    [self guardar];
}
-(NSString *)getToken{
    NSString *token=[datos objectForKey:@"Token"];
    return token;
}
-(void)setToken:(NSString *)token{
    NSMutableDictionary *newData = [datos mutableCopy];
    [newData setObject:token forKey:@"Token"];
    datos = newData;
    [self guardar];
}
@end
