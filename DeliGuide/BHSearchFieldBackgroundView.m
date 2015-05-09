//
//  BHSearchFieldBackgroundView.m
//  DeliGuide
//
//  Created by AJ Green on 5/9/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHSearchFieldBackgroundView.h"

@implementation BHSearchFieldBackgroundView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// Color Declarations
    UIColor* color1 = [UIColor colorWithRed:0.0f
                                      green:0.0f
                                       blue:0.0f
                                      alpha:1.0f];
    
    //// Slices
    {
        //// search-field
        {
            //// Bezier 2 Drawing
            
            // width =  306
            // height = 38
            CGFloat miterLimit = 4.0f;
            CGFloat halfModifier = 0.5f;
            CGFloat zeroConstant = 0.0f;
            CGFloat startConstant = 20.0f;
            CGFloat widthSpacer = 20.0f;
            CGFloat widthSpacerTwo = 8.95f;
            CGFloat heightSpacer = 8.0f;
            CGFloat totalWidth = self.frame.size.width;
            CGFloat totalHeight = self.frame.size.height;
            
            UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
            [bezier2Path moveToPoint: CGPointMake(totalWidth - widthSpacer,
                                                  totalHeight - heightSpacer)];
            [bezier2Path addCurveToPoint: CGPointMake(totalWidth,
                                                      ((totalHeight -heightSpacer) * halfModifier))
                           controlPoint1: CGPointMake(totalWidth - widthSpacerTwo, totalHeight-heightSpacer)
                           controlPoint2: CGPointMake(totalWidth, (totalHeight - ((totalHeight-heightSpacer)*halfModifier)))];
            
            [bezier2Path addLineToPoint: CGPointMake(totalWidth, ((totalHeight - heightSpacer)*halfModifier))];
            [bezier2Path addCurveToPoint: CGPointMake(totalWidth-widthSpacer, zeroConstant)
                           controlPoint1: CGPointMake(totalWidth, (((totalHeight - heightSpacer)*halfModifier))*halfModifier)
                           controlPoint2: CGPointMake(totalWidth -heightSpacer, zeroConstant)];
            
            [bezier2Path addLineToPoint: CGPointMake(startConstant, zeroConstant)];
            [bezier2Path addCurveToPoint: CGPointMake(zeroConstant, ((totalHeight - heightSpacer) * halfModifier))
                           controlPoint1: CGPointMake(widthSpacerTwo, zeroConstant)
                           controlPoint2: CGPointMake(zeroConstant, (((totalHeight - heightSpacer)*halfModifier))*halfModifier)];
            
            [bezier2Path addLineToPoint: CGPointMake(zeroConstant, ((totalHeight - heightSpacer) * halfModifier))];
            [bezier2Path addCurveToPoint: CGPointMake(widthSpacer, totalHeight - heightSpacer)
                           controlPoint1: CGPointMake(zeroConstant, (totalHeight - ((totalHeight-heightSpacer)*halfModifier)))
                           controlPoint2: CGPointMake(widthSpacerTwo, totalHeight - heightSpacer)];
            
            [bezier2Path addLineToPoint: CGPointMake(totalWidth-widthSpacer, totalHeight - heightSpacer)];
            [bezier2Path closePath];
            bezier2Path.miterLimit = miterLimit;
            
            bezier2Path.usesEvenOddFillRule = YES;
            
            [color1 setFill];
            [bezier2Path fill];
        }
    }

}


@end
