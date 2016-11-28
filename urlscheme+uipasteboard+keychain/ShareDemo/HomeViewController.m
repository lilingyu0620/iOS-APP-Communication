//
//  HomeViewController.m
//  ShareDemo
//
//  Created by lly on 16/3/1.
//  Copyright © 2016年 lly. All rights reserved.
//

#import "HomeViewController.h"
#import "LLYPasteboard.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Home";
    self.edgesForExtendedLayout = UIRectEdgeNone;
}
- (IBAction)shareBtnClicked:(id)sender {
    //拷贝分享内容到粘贴板
    NSString *shareStr = self.myTextView.text;
    NSDictionary *sharDic = [NSDictionary dictionaryWithObject:shareStr forKey:@"String"];
    [LLYPasteboard copyToPasterboardWithDictionary:sharDic];
    
    
    //跳转到MyDemo
    NSString *scheme = @"MyDemo://";
    scheme = [scheme stringByAppendingFormat:@"?appname=%@&callback=%@",@"ShareDemo",@"sharedemo"];
    NSURL *openURL = [NSURL URLWithString:scheme];

    if ([[UIApplication sharedApplication]canOpenURL:openURL]) {
        [[UIApplication sharedApplication]openURL:openURL];
    }
    else{
    
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"URL error"
                                                        message:[NSString stringWithFormat:
                                                                 @"No custom URL defined for %@",scheme]
                                                       delegate:self cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
    
    }
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
