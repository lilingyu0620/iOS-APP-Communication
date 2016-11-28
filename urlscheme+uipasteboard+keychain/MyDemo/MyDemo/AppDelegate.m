//
//  AppDelegate.m
//  MyDemo
//
//  Created by lly on 16/3/1.
//  Copyright © 2016年 lly. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "LLYPasteboard.h"
#import "ShareViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    RootViewController *rtVC = [[RootViewController alloc]init];
    UINavigationController *naVC = [[UINavigationController alloc]initWithRootViewController:rtVC];
    self.window.rootViewController = naVC;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    // Check the calling application Bundle ID
    if ([sourceApplication isEqualToString:@"com.sohu.demo.ShareDemo"])
    {
        NSLog(@"Calling Application Bundle ID: %@", sourceApplication);
        NSLog(@"URL scheme:%@", [url scheme]);
        NSLog(@"URL query: %@", [url query]);

        //        [[NSUserDefaults standardUserDefaults]setValue:[url query] forKey:@"URLQuery"];
        return YES;
    }
    else
        return NO;
    
}

- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<NSString *,
                     id> *)options {
    
    NSString *bundleId = [options valueForKey:@"UIApplicationOpenURLOptionsSourceApplicationKey"];
    NSLog(@"%@",options);
    // Check the calling application Bundle ID
    if ([bundleId isEqualToString:@"com.sohu.demo.ShareDemo"])
    {
        NSLog(@"Calling Application Bundle ID: %@", bundleId);
        NSLog(@"URL scheme:%@", [url scheme]);
        NSLog(@"URL query: %@", [url query]);
        
        NSString *paraStr = [url query];
        NSArray *paraArr = [paraStr componentsSeparatedByString:@"&"];
        
        
        NSDictionary *shareDic = [LLYPasteboard getPasterboardData];
        NSString *shareStr = [shareDic valueForKey:@"String"];
        
        ShareViewController *shareVC = [[ShareViewController alloc]init];
        shareVC.shareString = shareStr;
        shareVC.appName = [paraArr[0] substringFromIndex:8];
        shareVC.callbackScheme = [paraArr[1] substringFromIndex:9];
        [self.window.rootViewController presentViewController:shareVC animated:YES completion:^{
            //
        }];

        return YES;
    }
    else
        return NO;
}


@end
