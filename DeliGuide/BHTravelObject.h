//
//  TravelObject.h
//  DeliGuide
//
//  Created by AJ Green on 3/11/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BHTravelObject : NSObject

@property (nonatomic, assign) ModeOfTransportation travelMode;
@property (nonatomic, assign) CGFloat travelTime;
@property (nonatomic, strong) NSString *travelString;
@property (nonatomic, strong) NSString *longTravelString;

@end
