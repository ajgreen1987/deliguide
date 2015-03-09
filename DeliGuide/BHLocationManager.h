//
//  BHLocationManager.h
//  DeliGuide
//
//  Created by AJ Green on 3/7/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface BHLocationManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

+ (instancetype) locationManager;
- (void)requestLocationServicesAuthorization;

@end
