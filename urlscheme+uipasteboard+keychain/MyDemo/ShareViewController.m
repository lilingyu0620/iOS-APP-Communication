//
//  ShareViewController.m
//  MyDemo
//
//  Created by lly on 16/3/1.
//  Copyright © 2016年 lly. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.shareLabel.text = _shareString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sendBtnClicked:(id)sender {
    
    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"提示" message:@"分享成功！" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"留下来" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //留下来
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:[NSString stringWithFormat:@"返回%@",_appName] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //返回ShareDemo
        
        NSString *schemeStr = [NSString stringWithFormat:@"%@://",_callbackScheme];
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:schemeStr]];

//        if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:schemeStr]]) {
//        }
//        else{
//            [self dismissViewControllerAnimated:YES completion:nil];
//        }
    }];
    [alertCon addAction:cancelAction];
    [alertCon addAction:okAction];
    
    [self presentViewController:alertCon animated:YES completion:^{
        //
    }];
    
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
