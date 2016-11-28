//
//  LLYKeyChain.h
//  KeychainDemo
//
//  Created by lly on 16/2/23.
//  Copyright © 2016年 lly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>


extern NSString * const KEY_USERNAME_PASSWORD;
extern NSString * const KEY_USERNAME;
extern NSString * const KEY_PASSWORD;


@interface LLYKeyChain : NSObject

//保存用户名和密码到keychain
+(void)save:(NSString *)service data:(id)data;
//从keychain获取用户名
+(id)load:(NSString *)service;
//从keychain中删除用户名和密码
+(void)delete:(NSString *)service;


@end
