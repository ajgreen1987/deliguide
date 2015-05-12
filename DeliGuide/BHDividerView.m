//
//  BHDividerView.m
//  DeliGuide
//
//  Created by AJ Green on 5/11/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHDividerView.h"

@implementation BHDividerView

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self setBackgroundColor:GRAY_1];
        [self setAlpha:0.3f];
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
