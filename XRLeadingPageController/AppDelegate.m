//
//  AppDelegate.m
//  XRLeadingPageController
//
//  Created by Ru on 6/1/17.
//  Copyright © 2017年 Ru. All rights reserved.
//

#import "AppDelegate.h"
#import "XRLeadingPageViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //如果是第一次安装 显示引导页
    XRLeadingPageViewController *leadController = [[XRLeadingPageViewController alloc]initWithPagesCount:5 setupCellHandler:^(XRLeadingPageCell *cell, NSIndexPath *indexPath) {
        //设置图片
        NSString *imageName = [NSString stringWithFormat:@"wangyiyun%ld",indexPath.row];
        cell.imageView.image = [UIImage imageNamed:imageName];
        
        
        //设置按钮属性
        [cell.finishBtn setTitle:@"立即体验" forState:UIControlStateNormal];
        [cell.finishBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        
    } finishCellHandler:^(UIButton *finishBtn) {
    
        NSLog(@"点击了完成按钮");
    }];
    
    //自定义属性
    leadController.pageControl.pageIndicatorTintColor = [UIColor yellowColor];
    leadController.pageControl.currentPageIndicatorTintColor = [UIColor purpleColor];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = leadController;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
