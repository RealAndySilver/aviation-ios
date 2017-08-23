//
//  ListSaver.h
//
//  Created by Andres Abril on 17/08/17.
//  Copyright (c) 2017 Andres Abril. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListSaver : NSObject{
    NSDictionary *datos;
    NSDictionary *datosFriendList;
    
}
-(NSDictionary*)getDictionary:(NSString*)key;
-(void)setDictionary:(NSDictionary*)dictionary withKey:(NSString*)key;
-(NSString*)getToken;
-(void)setToken:(NSString*)token;

@end
