//
//  DeliObject.h
//  DeliGuide
//
//  Created by AJ Green on 3/11/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeliObject : NSObject

@property (nonatomic, strong) NSString *deliName;
@property (nonatomic, strong) NSString *deliAddress;
@property (nonatomic, strong) NSString *deliDisplayAddress;
@property (nonatomic, strong) NSMutableArray *deliMenu;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, assign) CGFloat satisfactionPercentage;
@property (nonatomic, strong) NSString *deliHours;
@property (nonatomic, assign) BOOL isFeatured;
@property (nonatomic, strong) NSMutableDictionary *deliMoreInformation;
@property (nonatomic, strong) NSMutableArray *deliTravelTimes;

@end
