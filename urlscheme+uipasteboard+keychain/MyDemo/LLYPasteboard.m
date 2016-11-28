//
//  LLYPasteboard.m
//  ShareDemo
//
//  Created by lly on 16/3/1.
//  Copyright © 2016年 lly. All rights reserved.
//

#import "LLYPasteboard.h"
#import <UIKit/UIKit.h>

NSString * const LLYPasteboardType = @"com.sohu.demo,sharedemo";

@implementation LLYPasteboard


#pragma mark- copy
+ (void)copyToPasterboardWithDictionary:(NSDictionary*)dic{

    UIPasteboard *generalPasteboard = [UIPasteboard generalPasteboard];
    generalPasteboard.persistent = YES;//持久化
    
    NSData *dicData = [NSKeyedArchiver archivedDataWithRootObject:dic];
    //数据加密过程,这里省略
    [generalPasteboard setData:dicData forPasteboardType:LLYPasteboardType];
}

#pragma mark- paster
+ (NSDictionary*)getPasterboardData{

    UIPasteboard *generalPasteboard = [UIPasteboard generalPasteboard];
    NSData *dicData = [generalPasteboard dataForPasteboardType:LLYPasteboardType];
    //解密过程 省略。。。
    NSDictionary *dic = [NSKeyedUnarchiver unarchiveObjectWithData:dicData];
    
    return dic;
}


@end
