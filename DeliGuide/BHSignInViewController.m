//
//  BHSignInViewController.m
//  DeliGuide
//
//  Created by AJ Green on 4/6/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHSignInViewController.h"

@implementation BHSignInViewController

- (void) viewDidLoad
{
    self.screenName = @"SIGNIN";
    self.title = @"Sign In";    
}

- (IBAction)handleTouchIDToggleTouchUpInside:(id)sender
{
    UIButton *toggleButton = (UIButton*)sender;
    
    [toggleButton setSelected:!toggleButton.isSelected];
}
@end
