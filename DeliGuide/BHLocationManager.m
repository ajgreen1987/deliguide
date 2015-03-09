//
//  BHLocationManager.m
//  DeliGuide
//
//  Created by AJ Green on 3/7/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHLocationManager.h"

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
}

#pragma mark - CLLocationMangerDelegate methods

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    /*
     Handle the failure...
     */
    [self.locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    /*
     Do something with the new location the application just received...
     */
    [self.locationManager stopUpdatingLocation];
}

@end
