//
//  ShareViewController.h
//  MyDemo
//
//  Created by lly on 16/3/1.
//  Copyright © 2016年 lly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *shareLabel;
@property (copy, nonatomic) NSString *shareString;
@property (copy, nonatomic) NSString *appName;
@property (copy, nonatomic) NSString *callbackScheme;
@end
