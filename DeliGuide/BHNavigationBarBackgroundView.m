//
//  BHNavigationBarBackgroundView.m
//  DeliGuide
//
//  Created by AJ Green on 5/9/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHNavigationBarBackgroundView.h"

static BHNavigationBarBackgroundView *background;

@implementation BHNavigationBarBackgroundView

+ (instancetype) background
{
    @synchronized(self) {
        if (background == nil)
        {
            background = [[self alloc] init];
        }
    }
    return background;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color1 = [UIColor colorWithRed: 0.958 green: 0.861 blue: 0.733 alpha: 0.095];
    UIColor* color0 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* color2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.19];
    
    //// Gradient Declarations
    CGFloat linearGradient1Locations[] = {0, 1};
    CGGradientRef linearGradient1 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)color1.CGColor, (id)color2.CGColor], linearGradient1Locations);
    
    //// Slices
    {
        //// bg-navbar
        {
            //// Group 3
            {
                //// path-2 Drawing
                UIBezierPath* path2Path = UIBezierPath.bezierPath;
                [path2Path moveToPoint: CGPointMake(0, 0)];
                [path2Path addLineToPoint: CGPointMake(self.window.bounds.size.width, 0)];
                [path2Path addLineToPoint: CGPointMake(self.window.bounds.size.width, 64)];
                [path2Path addLineToPoint: CGPointMake(0, 64)];
                [path2Path addLineToPoint: CGPointMake(0, 0)];
                [path2Path addLineToPoint: CGPointMake(0, 0)];
                [path2Path closePath];
                path2Path.miterLimit = 4;
                
                path2Path.usesEvenOddFillRule = YES;
                
                [color0 setFill];
                [path2Path fill];
                
                
                //// path- Drawing
                
                
                //// path- 3 Drawing
                
                
                //// path- 4 Drawing
                UIBezierPath* path4Path = UIBezierPath.bezierPath;
                [path4Path moveToPoint: CGPointMake(0, 0)];
                [path4Path addLineToPoint: CGPointMake(self.window.bounds.size.width, 0)];
                [path4Path addLineToPoint: CGPointMake(self.window.bounds.size.width, 64)];
                [path4Path addLineToPoint: CGPointMake(0, 64)];
                [path4Path addLineToPoint: CGPointMake(0, 0)];
                [path4Path addLineToPoint: CGPointMake(0, 0)];
                [path4Path closePath];
                path4Path.miterLimit = 4;
                
                path4Path.usesEvenOddFillRule = YES;
                
                CGContextSaveGState(context);
                [path4Path addClip];
                CGContextDrawLinearGradient(context, linearGradient1,
                                            CGPointMake(self.window.bounds.size.width*.65f, 64),
                                            CGPointMake(self.window.bounds.size.width*.65f, 0),
                                            kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
                CGContextRestoreGState(context);
            }
        }
    }
    
    
    //// Cleanup
    CGGradientRelease(linearGradient1);
    CGColorSpaceRelease(colorSpace);

}


@end
