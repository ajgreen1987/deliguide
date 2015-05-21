//
//  BHDeliAnnotation.m
//  DeliGuide
//
//  Created by AJ Green on 5/13/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHDeliAnnotation.h"

@implementation BHDeliAnnotation

-(id)initWithCoordinate:(CLLocationCoordinate2D) coordinate {
    if ((self = [super init]))
    {
        self.coordinate = coordinate;
    }
    
    return self;
}

@end