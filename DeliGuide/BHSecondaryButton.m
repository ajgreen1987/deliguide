//
//  BHSecondaryButton.m
//  DeliGuide
//
//  Created by AJ Green on 5/11/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHSecondaryButton.h"

@implementation BHSecondaryButton

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [[self titleLabel] setFont:AppFontSabonRomanSC(18)];
        [[self titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
        [[self titleLabel] setNumberOfLines:0];
        [[self titleLabel] setTextAlignment:NSTextAlignmentCenter];
        [self setTitleColor:GOLD_2
                   forState:UIControlStateNormal];
        
    }
    
    return self;
}

@end
