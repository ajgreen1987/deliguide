//
//  TravelObject.m
//  DeliGuide
//
//  Created by AJ Green on 3/11/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHTravelObject.h"

@implementation BHTravelObject

- (NSString*) travelString
{
    switch (self.travelMode)
    {
        case WALKING:
            return @"walk";
            break;
        case BIKING:
            return @"ride";
            break;
        case DRIVING:
            return @"drive";
            break;
        default:
            return @"by transit";
            break;
    }
}

- (NSString*) longTravelString
{
    switch (self.travelMode)
    {
        case WALKING:
            return @"Walking";
            break;
        case BIKING:
            return @"Biking";
            break;
        case DRIVING:
            return @"Driving";
            break;
        default:
            return @"Public Transit";
            break;
    }

}

@end
