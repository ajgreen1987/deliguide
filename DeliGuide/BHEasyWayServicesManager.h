//
//  BHEasyWayServicesManager.h
//  DeliGuide
//
//  Created by AJ Green on 4/25/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@interface BHEasyWayServicesManager : NSObject

+ (instancetype) servicesManager;

+ (void) getDirectionsFromLocation:(CLLocation *)location
                        toLocation:(CLLocation*)aNewLocation;

@end
