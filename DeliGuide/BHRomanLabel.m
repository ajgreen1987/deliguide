//
//  BHRomanLabel.m
//  DeliGuide
//
//  Created by AJ Green on 5/29/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHRomanLabel.h"

@implementation BHRomanLabel

- (void) awakeFromNib
{
    CGFloat fontSize = self.font.pointSize;
    [self setFont:AppFontSabonRoman(fontSize)];
}

@end
