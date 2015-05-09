//
//  BHLocationSearchTextField.h
//  DeliGuide
//
//  Created by AJ Green on 5/6/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BHLocationSearchTextFieldDelegate <NSObject>

- (void) tappedLocationButton;

@end

@interface BHLocationSearchTextField : UITextField

@property (nonatomic, weak) IBOutlet id<BHLocationSearchTextFieldDelegate> searchDelegate;
@property (nonatomic, weak) IBInspectable UIImage *searchImage;
@property (nonatomic, weak) IBInspectable UIImage *buttonImage;

@end
