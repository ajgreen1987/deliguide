//
//  BHLocationSearchTextField.h
//  DeliGuide
//
//  Created by AJ Green on 5/6/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BHLocationSearchTextFieldDelegate <NSObject>

- (void) didStartEditing;
- (void) didCancelEditing;
- (void) didEndEditing;
- (void) tappedLocationButton;

@end

@interface BHLocationSearchTextField : UITextField <UITextFieldDelegate>

- (id) initWithFrame:(CGRect)frame
         searchImage:(UIImage*)searchImage
      andButtonImage:(UIImage*)buttonImage;

@property (nonatomic, weak) IBOutlet id<BHLocationSearchTextFieldDelegate> searchDelegate;
@property (nonatomic, weak) IBInspectable UIImage *searchImage;
@property (nonatomic, weak) IBInspectable UIImage *buttonImage;

- (void) handleCancel;

@end
