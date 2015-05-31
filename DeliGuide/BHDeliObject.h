//
//  DeliObject.h
//  DeliGuide
//
//  Created by AJ Green on 3/11/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BHTravelObject.h"
#import "BHMenuItemObject.h"

@interface BHDeliObject : NSObject

@property (nonatomic, strong) NSString *deliName;
@property (nonatomic, strong) NSString *deliAddress;
@property (nonatomic, strong) NSString *deliDisplayAddress;
@property (nonatomic, strong) NSMutableArray *deliMenu;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSURL *website;
@property (nonatomic, assign) CGFloat satisfactionPercentage;
@property (nonatomic, strong) NSDictionary *deliHours;
@property (nonatomic, assign) BOOL isFeatured;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;
@property (nonatomic, strong) NSMutableArray *deliTravelTimes;
@property (nonatomic, assign) BOOL isTakeoutAvailable;
@property (nonatomic, assign) BOOL isDeliveryAvailable;
@property (nonatomic, strong) NSMutableArray *paymentMethods;


@end
