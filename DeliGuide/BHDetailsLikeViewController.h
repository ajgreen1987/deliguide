//
//  BHDetailsLikeViewController.h
//  DeliGuide
//
//  Created by AJ Green on 5/21/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopoverView.h"

@protocol BHDetailsLikeViewDelegate <NSObject>

- (void) noThanksTapped;
- (void) shareItTapped;

@end

@interface BHDetailsLikeViewController : UIViewController

@property (nonatomic, assign) id<BHDetailsLikeViewDelegate> delegate;
@property (nonatomic, weak) PopoverView *popover;

- (IBAction) handleNoThanksTapped:(id)sender;
- (IBAction) handleShareItTapped:(id)sender;

@end
