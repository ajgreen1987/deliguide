//
//  MenuObject.h
//  DeliGuide
//
//  Created by AJ Green on 3/11/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BHMenuItemObject : NSObject

@property (nonatomic, strong) NSString *menuCategory;
@property (nonatomic, strong) NSString *menuSubCategory;
@property (nonatomic, strong) NSString *menuItemName;
@property (nonatomic, strong) NSString *menuItemDetails;
@property (nonatomic, strong) NSString *menuItemPrice;

@end
