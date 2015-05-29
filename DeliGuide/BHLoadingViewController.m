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
#import "BHWebViewController.h"

@implementation BHLoadingViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    self.screenName = @"LOADING";
    self.title = @"New York Deli Guide";
}

- (void) viewDidAppear:(BOOL)animated
{
    [self handleProbableNavigationTrees];
    [[BHLocationManager locationManager] setLocationManagerDelegate:self];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [[BHLocationManager locationManager] setLocationManagerDelegate:nil];
}


- (IBAction)unwindToMenuViewController:(UIStoryboardSegue *)segue { }

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
    [self performSegueWithIdentifier:@"MapView"
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
    else if(![[[BHApplicationManager appManager] urlToLoad] isEqualToString:EMPTY_URL])
    {

            BHWebViewController *webView = [[BHWebViewController alloc] initWithNibName:@"BHWebViewController"
                                                                                 bundle:nil
                                                                                 andURL:[NSURL URLWithString:[[BHApplicationManager appManager] urlToLoad]]];
            
            [[self navigationController] pushViewController:webView animated:YES];
    }
}

#pragma mark - Location Delegate
- (void) userDeniedPermission
{    
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

#pragma mark - Search Delegate

- (void) customSearchbarTouchedUserLocation
{
    [[BHLocationManager locationManager] requestLocationServicesAuthorization];
}

- (void) customSearchbarEnteredText:(NSString *)textEntered
{
    // Perform search for text entered
}

@end
