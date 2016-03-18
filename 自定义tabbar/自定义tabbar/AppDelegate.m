//
//  AppDelegate.m
//  自定义tabbar
//
//  Created by 杨超 on 16/3/16.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import "AppDelegate.h"

#import "ICSDrawerController.h"
#import "firstViewController.h"
#import "SecondViewController.h"
#import "ThereViewController.h"
#import "FourthViewController.h"
#import "LeftViewController.h"
#import <AFNetworking/AFNetworking.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [UIViewController new];
    //自定义tabbar的实现以后逐渐完善(也会加一些其它封装的东西用type的值决定)
   
   
    
    LeftViewController *left = [[LeftViewController alloc]init];
    
    int type = 1;
    switch (type) {
        case 0://自定义tabbar选用XDTbabar框架
            self.window.rootViewController = [XDTarBarViewController initXDTabBar];
            break;
        case 1:{
            //侧滑控件（实现了侧滑和tabbar的联合使用）
            self.XDtababr = [[XDTarBarViewController alloc]init];
            ICSDrawerController *draw = [[ICSDrawerController alloc]initWithLeftViewController:left centerViewController:self.XDtababr];
            self.window.rootViewController = draw;
        }
            
            break;
        default:
            break;
    }
    
    [self.window makeKeyAndVisible];
    
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


@end
