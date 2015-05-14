//
//  BHInputTextField.m
//  DeliGuide
//
//  Created by AJ Green on 5/13/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHInputTextField.h"

@implementation BHInputTextField

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        self.font = AppFontAvenirRegular(15);
        [self setupLeftView];
    }
    
    return self;
}

- (void) setupLeftView
{
    UIView *blank = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 8.0f, self.frame.size.height)];
    
    self.leftView = blank;
    self.leftViewMode = UITextFieldViewModeAlways;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// Color Declarations
    UIColor* color1 = [UIColor colorWithRed: 1 green: 0.986 blue: 0.951 alpha: 1];
    
    //// Slices
    {
        //// input
        {
            UIRectCorner corner;
            
            if (self.topLeftCornerRadius)
            {
                corner += UIRectCornerTopLeft;
            }
            if (self.topRightCornerRadius)
            {
                corner += UIRectCornerTopRight;
            }
            if (self.bottomLeftCornerRadius)
            {
                corner += UIRectCornerBottomLeft;
            }
            if (self.bottomRightCornerRadius)
            {
                corner += UIRectCornerBottomRight;
            }
            
            //// Rectangle  Drawing
            UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0,
                                                                                              0,
                                                                                              self.frame.size.width,
                                                                                              self.frame.size.height)
                                                                byRoundingCorners: corner
                                                                      cornerRadii: CGSizeMake(2, 2)];
            [rectanglePath closePath];
            [color1 setFill];
            [rectanglePath fill];
        }
    }


}


@end
