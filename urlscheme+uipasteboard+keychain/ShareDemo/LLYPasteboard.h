//
//  LLYPasteboard.h
//  ShareDemo
//
//  Created by lly on 16/3/1.
//  Copyright © 2016年 lly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLYPasteboard : NSObject

extern NSString * const LLYPasteboardType;

#pragma mark- copy
+ (void)copyToPasterboardWithDictionary:(NSDictionary*)dic;

#pragma mark- paster
+ (NSDictionary*)getPasterboardData;



@end
