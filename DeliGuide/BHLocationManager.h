//
//  BHLocationManager.h
//  DeliGuide
//
//  Created by AJ Green on 3/7/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol BHLocationManagerDelegate <NSObject>

@optional
- (void) userDeniedPermission;
- (void) userAllowedPermission;
- (void) didUpdateUserLocationFromLocation:(CLLocation*)anOldLocation toLocation:(CLLocation*)aNewLocation;

@end

@interface BHLocationManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic, weak) id<BHLocationManagerDelegate> locationManagerDelegate;
@property (nonatomic, strong) CLLocationManager *locationManager;

+ (instancetype) locationManager;

+ (void)presentGPSUnavailableAlertForController:(UIViewController*)aController;
+ (void)presentGPSPermissionDeniedAlertForController:(UIViewController*)aController;
+ (void)presentNoConnectionAlertForController:(UIViewController*)aController;
+ (BOOL)isLocationAccessAuthorized;

- (void)requestLocationServicesAuthorization;
- (void) startUpdatingUserLocation;

@end
