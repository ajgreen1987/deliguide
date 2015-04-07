//
//  BHSignUpViewController.m
//  DeliGuide
//
//  Created by AJ Green on 4/6/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHSignUpViewController.h"

#define kMaxTextFields 3

@interface BHSignUpViewController ()

@property (nonatomic, assign) NSInteger currentTextField;

@end

@implementation BHSignUpViewController

- (void) viewDidLoad
{
    self.currentTextField = 0;
    
    self.screenName = @"SIGNUP";
    self.title = @"Sign Up";
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.currentTextField = textField.tag;
    
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
    [self.scrollView setContentOffset:scrollPoint animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.scrollView setContentOffset:CGPointZero animated:YES];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    if (self.currentTextField < kMaxTextFields)
    {
        self.currentTextField++;
        
        UITextField *currentField = (UITextField*)[self.view viewWithTag:self.currentTextField];
        [currentField becomeFirstResponder];
        
        return NO;
    }
    
    [textField resignFirstResponder];
    return YES;
}


@end
