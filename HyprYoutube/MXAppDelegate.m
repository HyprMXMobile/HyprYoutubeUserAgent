//
//  MXAppDelegate.m
//  HyprYoutube
//
//  Created by Jeremy Ellison on 6/28/13.
//  Copyright (c) 2013 HyprMX. All rights reserved.
//

#import "MXAppDelegate.h"

#import "MXViewController.h"

@implementation MXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSDictionary* plist = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"user-agents" ofType:@"plist"]];
    
    // Set user agent
    NSString* modelString = [[[UIDevice currentDevice].model componentsSeparatedByString:@" "] objectAtIndex:0];// iPhone, iPad, or iPod
    NSString* versionString = [[[UIDevice currentDevice] systemVersion] stringByReplacingOccurrencesOfString:@"." withString:@"_"]; // 5_1
    NSString* ua = [[plist valueForKey:modelString] valueForKey:versionString];
    
    if (nil == ua) {
        [NSException raise:@"No User Agent" format:@"For Device: %@, Version: %@", modelString, versionString];
    }
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                 ua,
                                 @"UserAgent", nil];
    NSLog(@"Settings: %@", dictionary);
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];

    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[MXViewController alloc] initWithNibName:@"MXViewController_iPhone" bundle:nil];
    } else {
        self.viewController = [[MXViewController alloc] initWithNibName:@"MXViewController_iPad" bundle:nil];
    }
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
