//
//  BHLoadingViewController.m
//  DeliGuide
//
//  Created by AJ Green on 3/12/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHLoadingViewController.h"
#import "BHLocationManager.h"
#import "BHApplicationManager.h"

@implementation BHLoadingViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    self.screenName = @"Loading";
    [[BHLocationManager locationManager] setLocationManagerDelegate:self];
}

- (IBAction)handleLocationTouchUpInside:(id)sender
{
    [[BHLocationManager locationManager] requestLocationServicesAuthorization];
}

#pragma mark - Controller Segue
- (void) presentMapController
{
    [self performSegueWithIdentifier:@"LandingPage"
                              sender:self];
}

#pragma mark - Location Delegate
- (void) userDeniedPermission
{
    [self presentMapController];
    
    [self presentGPSPermissionDeniedAlert];
}

- (void) userAllowedPermission
{
    [self presentMapController];
}

#pragma mark - Alert Views
-(void)presentGPSUnavailableAlert
{
    UIAlertView *alertView = [[BHApplicationManager appManager] getErrorMessageAlertViewWithTitle:@"Error"
                                                                            message:@"GPS location data is unavailable on this device.\nPlease try again."
                                                                     viewController:self];
    alertView.tag = 404;
    [alertView show];
}

-(void)presentGPSPermissionDeniedAlert
{
    UIAlertView *alertView = [[BHApplicationManager appManager] getErrorMessageAlertViewWithTitle:@"Location Service Disabled"
                                                                            message:@"To re-enable, please go to Settings and turn on Location Service for this app."
                                                                     viewController:self];
    alertView.tag = 404;
    [alertView show];
}

-(void)presentNoConnectionAlert
{    
    UIAlertView *alertView = [[BHApplicationManager appManager] getErrorMessageAlertViewWithTitle:@"Connectivity Issue"
                                                                            message:@"Device has no wifi or mobile connectivity. Please try the operation after establishing connectivity."
                                                                     viewController:self];
    alertView.tag = 404;
    [alertView show];
}

@end
