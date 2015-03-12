//
//  BHTableView.m
//  DeliGuide
//
//  Created by AJ Green on 3/11/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHTableView.h"

@implementation BHTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    id hitView = [super hitTest:point withEvent:event];
    if (point.y<0) {
        return nil;
    }
    return hitView;
}

@end
