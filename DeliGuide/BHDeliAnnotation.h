//
//  BHDeliAnnotation.h
//  DeliGuide
//
//  Created by AJ Green on 5/13/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mapkit/Mapkit.h>
#import "BHDeliObject.h"

@interface BHDeliAnnotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

-(id)initWithCoordinate:(CLLocationCoordinate2D) coordinate;

@end

