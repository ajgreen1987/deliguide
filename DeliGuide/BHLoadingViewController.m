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

- (void) viewWillDisappear:(BOOL)animated
{
    [[BHLocationManager locationManager] setLocationManagerDelegate:nil];
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
    [BHLocationManager presentGPSUnavailableAlertForController:self];
}

-(void)presentGPSPermissionDeniedAlert
{
    [BHLocationManager presentGPSPermissionDeniedAlertForController:self];
}

-(void)presentNoConnectionAlert
{    
    [BHLocationManager presentNoConnectionAlertForController:self];
}

@end
