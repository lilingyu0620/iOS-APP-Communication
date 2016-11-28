//
//  RootViewController.m
//  ShareDemo
//
//  Created by lly on 16/3/1.
//  Copyright © 2016年 lly. All rights reserved.
//

#import "RootViewController.h"
#import "LLYKeyChain.h"
#import "HomeViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Login";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    //从keychain中读取用户名和密码
    NSMutableDictionary *readUsernamePassword = (NSMutableDictionary *)[LLYKeyChain load:KEY_USERNAME_PASSWORD];
    NSString *userName = [readUsernamePassword objectForKey:KEY_USERNAME];
    NSString *password = [readUsernamePassword objectForKey:KEY_PASSWORD];
    NSLog(@"username = %@", userName);
    NSLog(@"password = %@", password);
    
    self.usernameTextField.text = userName;
    self.passwordTextField.text = password;
}
- (IBAction)loginBtnClicked:(id)sender {
    
    NSMutableDictionary *userNamePasswordKVPairs = [NSMutableDictionary dictionary];
    [userNamePasswordKVPairs setObject:self.usernameTextField.text forKey:KEY_USERNAME];
    [userNamePasswordKVPairs setObject:self.passwordTextField.text forKey:KEY_PASSWORD];
    [LLYKeyChain save:KEY_USERNAME_PASSWORD data:userNamePasswordKVPairs];
    
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    [self.navigationController pushViewController:homeVC animated:YES];
    
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
