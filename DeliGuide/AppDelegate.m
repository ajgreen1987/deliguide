//
//  AppDelegate.m
//  DeliGuide
//
//  Created by AJ Green on 2/27/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "AppDelegate.h"
#import "GAI.h"
#import "BHLocationManager.h"
#import "BHNavigationBarBackgroundView.h"

@interface AppDelegate ()

- (void) setupRootViewController;
- (void) setupGoogleAnalytics;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
 
    [self setupRootViewController];
    [self setupGoogleAnalytics];
    [self setupNavigationControllerAppearance];
    
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

#pragma mark - Root Controller logic
- (void) setupRootViewController
{
    /*
    NSString *storyboardId = [BHLocationManager isLocationAccessAuthorized] ? SLIDING_MENU_STORYBOARD_ID : LOADING_CONTROLLER_STORYBOARD_ID;
    self.window.rootViewController = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:storyboardId];
     */
}

#pragma mark - Google Analytics
- (void) setupGoogleAnalytics
{
    // Optional: automatically send uncaught exceptions to Google Analytics.
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    
    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
    [GAI sharedInstance].dispatchInterval = 20;
    
    // Optional: set Logger to VERBOSE for debug information.
    [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelVerbose];
    
    // Initialize tracker. Replace with your tracking ID.
    [[GAI sharedInstance] trackerWithTrackingId:@"UA-24547261-13"];
}

- (void) setupNavigationControllerAppearance
{

    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];    
    
    [[UINavigationBar appearance] setBackIndicatorImage:NAVIGATION_BAR_BACK];
    [[[UINavigationBar appearance] layer] insertSublayer:[[BHNavigationBarBackgroundView background] layer] atIndex:0];
    [[UINavigationBar appearance] setBackgroundColor:[UIColor redColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],NSFontAttributeName:NAVIGATION_FONT}];
}

@end
