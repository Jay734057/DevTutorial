//
//  AppDelegate.m
//  DevTutorial
//
//  Created by Jianyu ZHU on 26/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "AppDelegate.h"
#import "TutorialTableViewController.h"
#import "UIColor+Helpers.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [_window makeKeyAndVisible];
    _window.rootViewController = [[TutorialTableViewController alloc]init];

    application.statusBarStyle = UIStatusBarStyleLightContent;
    [self setupStatusBar];
    return YES;
}

-(void) setupStatusBar {
    UIView *statusBarBackgroundView = [[UIView alloc]init];
    statusBarBackgroundView.backgroundColor = [UIColor colorWithRed:204 Green:31 Blue:31];
    statusBarBackgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_window addSubview: statusBarBackgroundView];
    [statusBarBackgroundView.leftAnchor constraintEqualToAnchor:_window.leftAnchor].active = YES;
    [statusBarBackgroundView.topAnchor constraintEqualToAnchor:_window.topAnchor].active = YES;
    [statusBarBackgroundView.rightAnchor constraintEqualToAnchor:_window.rightAnchor].active = YES;
    [statusBarBackgroundView.heightAnchor constraintEqualToConstant:20].active = YES;
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
