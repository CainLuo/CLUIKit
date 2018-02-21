//
//  AppDelegate.m
//  CLUIKitExample
//
//  Created by Cain Luo on 2018/2/17.
//  Copyright © 2018年 Cain Luo. All rights reserved.
//

#import "AppDelegate.h"
#import "EXRootController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (UIWindow *)window {
    
    CL_GET_METHOD_RETURN_OBJC(_window);
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    _window.backgroundColor = [UIColor whiteColor];
    
    return _window;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    EXRootController *ex_rootController = [[EXRootController alloc] init];
    
    ex_rootController.title = @"首页";
    ex_rootController.tabBarItem.image = [UIImage imageNamed:@"tab_home"];
    ex_rootController.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_homeH"];
    
    CLNavigationController *ex_rootNavigationController = [[CLNavigationController alloc] initWithRootViewController:ex_rootController];
    
    ex_rootNavigationController.cl_tintColor       = [UIColor whiteColor];
    ex_rootNavigationController.cl_backgroundImage = [UIImage imageNamed:@"navigationBarImage"];
    ex_rootNavigationController.cl_foregroundColor = [UIColor whiteColor];

    UITabBarController *ex_tabBarController = [[UITabBarController alloc] init];
    
    ex_tabBarController.viewControllers = @[ex_rootNavigationController];

    self.window.rootViewController = ex_tabBarController;
    
    [self.window makeKeyAndVisible];
    
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
