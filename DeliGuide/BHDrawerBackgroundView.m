//
//  BHDrawerBackgroundView.m
//  DeliGuide
//
//  Created by AJ Green on 5/9/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHDrawerBackgroundView.h"

@implementation BHDrawerBackgroundView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// Color Declarations
    UIColor* color1 = [UIColor colorWithRed:1
                                      green:0.986
                                       blue:0.951
                                      alpha:1];
    
    //// Slices
    {
        //// Backgrounds
        {
            //// bg-drawer Drawing
            UIBezierPath* bgdrawerPath = [UIBezierPath bezierPathWithRect: CGRectMake(self.frame.origin.x,
                                                                                      self.frame.origin.y,
                                                                                      self.frame.size.width,
                                                                                      self.frame.size.height)];
            [color1 setFill];
            [bgdrawerPath fill];
        }
    }

}


@end
