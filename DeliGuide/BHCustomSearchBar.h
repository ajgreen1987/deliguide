//
//  BHCustomSearchBar.h
//  DeliGuide
//
//  Created by AJ Green on 5/10/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BHLocationSearchTextField.h"

@interface BHCustomSearchBar : UIView <BHLocationSearchTextFieldDelegate>

@property (nonatomic, weak) IBInspectable UIImage *searchImage;
@property (nonatomic, weak) IBInspectable UIImage *buttonImage;

@end
