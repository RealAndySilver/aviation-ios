//
//  FileSaver.h
//
//  Created by Andres Abril on 27/08/15.
//  Copyright (c) 2015 Andres Abril. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileSaver : NSObject{
    NSDictionary *datos;
    NSDictionary *datosFriendList;
    
}
-(NSDictionary*)getDictionary:(NSString*)key;
-(void)setDictionary:(NSDictionary*)dictionary withKey:(NSString*)key;
-(NSString*)getToken;
-(void)setToken:(NSString*)token;

@end
