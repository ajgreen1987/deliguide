//
//  BHMockDataManager.h
//  DeliGuide
//
//  Created by AJ Green on 5/10/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BHUserObject, BHDeliObject;

@interface BHMockDataManager : NSObject

+ (BHUserObject*) anonymousUser;
+ (BHUserObject*) mockUser;

+ (NSArray*) mockDelis;
+ (NSArray*) mockFeaturedDelis;

@end
