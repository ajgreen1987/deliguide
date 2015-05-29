//
//  BHItalicLabel.m
//  DeliGuide
//
//  Created by AJ Green on 5/28/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHItalicLabel.h"

@implementation BHItalicLabel

- (void) awakeFromNib
{
    CGFloat fontSize = self.font.pointSize;
    [self setFont:AppFontSabonItalic(fontSize)];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
