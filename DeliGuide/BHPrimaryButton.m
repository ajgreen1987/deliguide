//
//  PrimaryButton.m
//  DeliGuide
//
//  Created by AJ Green on 5/6/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHPrimaryButton.h"

@implementation BHPrimaryButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color1 = [UIColor colorWithRed: 0.63 green: 0.141 blue: 0.106 alpha: 1];
    UIColor* color2 = [UIColor colorWithRed: 0.39 green: 0.067 blue: 0.051 alpha: 1];
    
    //// Gradient Declarations
    CGFloat linearGradient1Locations[] = {0, 1};
    CGGradientRef linearGradient1 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)color1.CGColor, (id)color2.CGColor], linearGradient1Locations);
    
    //// Slices
    {
        //// btn-primary
        {
            //// Group 3
            {
                //// Rectangle-91-Copy
                {
                    //// path-3 Drawing
                    UIBezierPath* path3Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) cornerRadius: 2];
                    CGContextSaveGState(context);
                    [path3Path addClip];
                    CGContextDrawLinearGradient(context, linearGradient1,
                                                CGPointMake(0, (self.frame.size.height*0.5f)),
                                                CGPointMake(self.frame.size.width, (self.frame.size.height*0.5f)),
                                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
                    CGContextRestoreGState(context);
                    
                    
                    //// path- Drawing
                    
                    
                    //// path- 2 Drawing
                    
                    
                    //// path- 4 Drawing
                }
            }
        }
    }
    
    
    //// Cleanup
    CGGradientRelease(linearGradient1);
    CGColorSpaceRelease(colorSpace);
}


@end
