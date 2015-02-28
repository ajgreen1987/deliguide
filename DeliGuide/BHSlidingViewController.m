//
//  BHSlidingViewController.m
//  DeliGuide
//
//  Created by AJ Green on 2/28/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHSlidingViewController.h"

#define LEFT_PEEK_AMOUNT 0.33f

@interface BHSlidingViewController ()

@end

@implementation BHSlidingViewController

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        self.anchorLeftPeekAmount = ([UIScreen mainScreen].bounds.size.width * LEFT_PEEK_AMOUNT);
        self.topViewAnchoredGesture = (ECSlidingViewControllerAnchoredGestureTapping | ECSlidingViewControllerAnchoredGesturePanning);
    }
    
    return self;
}

@end
