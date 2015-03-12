//
//  TravelObject.h
//  DeliGuide
//
//  Created by AJ Green on 3/11/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    WALKING,
    BIKING,
    DRIVING,
    PUBLIC
} ModeOfTransportation;

@interface TravelObject : NSObject

@property (nonatomic, assign) ModeOfTransportation *travelMode;
@property (nonatomic, assign) CGFloat travelTime;

@end
