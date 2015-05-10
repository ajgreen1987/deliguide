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
    
    self.screenName = @"LOADING";
    self.title = @"New York Deli Guide";
    
    [[BHLocationManager locationManager] setLocationManagerDelegate:self];
}

- (void) viewDidAppear:(BOOL)animated
{
    [self handleProbableNavigationTrees];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [[BHLocationManager locationManager] setLocationManagerDelegate:nil];
}


- (IBAction)unwindToMenuViewController:(UIStoryboardSegue *)segue { }

- (void)handleLocationTouchUpInside:(id)sender
{
    [[BHLocationManager locationManager] requestLocationServicesAuthorization];
}

- (IBAction) handleFavoritesTouchUpInside:(id)sender
{
    if ([[[[BHApplicationManager appManager] currentUser] favorites] count] < 1)
    {
        [self performSegueWithIdentifier:@"NoFavorites"
                                  sender:self];
    }
}

#pragma mark - Controller Segue
- (void) presentMapController
{
    [self performSegueWithIdentifier:@"LandingPage"
                              sender:self];
}

#pragma mark - Navigation
- (void) handleProbableNavigationTrees
{
    if ([[BHApplicationManager appManager] shouldSignIn])
    {
        [[BHApplicationManager appManager] setShouldSignIn:NO];
        
        [self performSegueWithIdentifier:@"SignInLoading"
                                  sender:self];
    }
    else if ([[BHApplicationManager appManager] shouldSignUp])
    {
        [[BHApplicationManager appManager] setShouldSignUp:NO];
        
        [self performSegueWithIdentifier:@"SignUpLoading"
                                  sender:self];
    }
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
