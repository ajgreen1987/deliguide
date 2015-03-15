//
//  BHLocationManager.m
//  DeliGuide
//
//  Created by AJ Green on 3/7/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHLocationManager.h"
#import "BHApplicationManager.h"

@interface BHLocationManager ()

- (BOOL) isDelegateValidForSelector:(SEL)aSelector;

@end

@implementation BHLocationManager

static BHLocationManager *sharedLocationManager = nil;

+ (instancetype) locationManager
{
    if (sharedLocationManager == nil)
    {
        sharedLocationManager = [[self alloc] init];
    }
    
    return sharedLocationManager;
}


- (void)requestLocationServicesAuthorization
{
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)
    {
        self.locationManager = [[CLLocationManager alloc] init];
        [self.locationManager setDelegate:self];
        
        /*
         When the application requests to start receiving location updates that is when the user is presented with a consent dialog.
         */
        [self.locationManager startUpdatingLocation];
        
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0"))
        {
            [self.locationManager requestWhenInUseAuthorization];
        }
    }
    else
    {
        if ([self isDelegateValidForSelector:@selector(userDeniedPermission)])
        {
            [[self locationManagerDelegate] userDeniedPermission];
        }
    }
}

- (void) startUpdatingUserLocation
{
    if ([BHLocationManager isLocationAccessAuthorized])
    {
        [self.locationManager startUpdatingLocation];
        self.locationManager.desiredAccuracy=kCLLocationAccuracyNearestTenMeters;
        
        if ([self isDelegateValidForSelector:@selector(userAllowedPermission)])
        {
            [[self locationManagerDelegate] userAllowedPermission];
        }
    }
    else
    {
        if ([self isDelegateValidForSelector:@selector(userDeniedPermission)])
        {
            [[self locationManagerDelegate] userDeniedPermission];
        }
    }
}

+ (BOOL)isLocationAccessAuthorized
{
    return ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied);
}

- (BOOL) isDelegateValidForSelector:(SEL)aSelector
{
    return ((self.locationManagerDelegate != nil) && [self.locationManagerDelegate respondsToSelector:aSelector]);
}

#pragma mark - BH Location Delegate
- (void) setLocationManagerDelegate:(id<BHLocationManagerDelegate>)locationManagerDelegate
{
    if (_locationManagerDelegate != nil)
    {
        _locationManagerDelegate = nil;
    }
    
    _locationManagerDelegate = locationManagerDelegate;
}


#pragma mark - CLLocationMangerDelegate methods

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    /*
     Handle the failure...
     */
    
    if([self isDelegateValidForSelector:@selector(userDeniedPermission)])
    {
        [[self locationManagerDelegate] userDeniedPermission];
    }
    
    [self.locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    /*
     Do something with the new location the application just received...
     */
    
    if ([self isDelegateValidForSelector:@selector(userAllowedPermission)])
    {
        [[self locationManagerDelegate] userAllowedPermission];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation*)newLocation fromLocation:(CLLocation *)oldLocation
{
    if ([self isDelegateValidForSelector:@selector(didUpdateUserLocationFromLocation:toLocation:)])
    {
        [[self locationManagerDelegate] didUpdateUserLocationFromLocation:oldLocation toLocation:newLocation];
    }
}

#pragma mark - Alert Views
+ (void)presentGPSUnavailableAlertForController:(UIViewController*)aController
{
    UIAlertView *alertView = [[BHApplicationManager appManager] getErrorMessageAlertViewWithTitle:@"Error"
                                                                                          message:@"GPS location data is unavailable on this device.\nPlease try again."
                                                                                   viewController:aController];
    alertView.tag = 404;
    [alertView show];
}

+ (void)presentGPSPermissionDeniedAlertForController:(UIViewController*)aController
{
    UIAlertView *alertView = [[BHApplicationManager appManager] getErrorMessageAlertViewWithTitle:@"Location Service Disabled"
                                                                                          message:@"To re-enable, please go to Settings and turn on Location Service for this app."
                                                                                   viewController:aController];
    alertView.tag = 404;
    [alertView show];
}

+ (void)presentNoConnectionAlertForController:(UIViewController*)aController
{
    UIAlertView *alertView = [[BHApplicationManager appManager] getErrorMessageAlertViewWithTitle:@"Connectivity Issue"
                                                                                          message:@"Device has no wifi or mobile connectivity. Please try the operation after establishing connectivity."
                                                                                   viewController:aController];
    alertView.tag = 404;
    [alertView show];
}

@end
