//
//  BHSignUpViewController.m
//  DeliGuide
//
//  Created by AJ Green on 4/6/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHSignUpViewController.h"
#import "BHApplicationManager.h"

#define kMaxTextFields  2
#define NAME_TAG        0
#define EMAIL_TAG       1
#define PASSWORD_TAG    2

@interface BHSignUpViewController ()

@property (nonatomic, assign) NSInteger currentTextField;

@end

@implementation BHSignUpViewController

- (void) viewDidLoad
{
    self.currentTextField = 0;
    
    self.screenName = @"SIGNUP";
    self.title = @"Create Your Account";
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.currentTextField = textField.tag;
    
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
    [self.scrollView setContentOffset:scrollPoint animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self setcurrentUserInformation:[textField text]
                forTextFieldWithTag:[textField tag]];
    
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

- (void) setcurrentUserInformation:(NSString*)information forTextFieldWithTag:(NSInteger)aTag
{
    switch (aTag)
    {
        case NAME_TAG:
            [[[BHApplicationManager appManager] currentUser] setUserName:information];
            break;
        case EMAIL_TAG:
            [[[BHApplicationManager appManager] currentUser] setUserEmail:information];
            break;
        default:
            [[[BHApplicationManager appManager] currentUser] setUserPassword:information];
            break;
    }
}

- (IBAction) handleSignUpTouchUpInside:(id)sender
{
    if ([[[BHApplicationManager appManager] currentUser] isReadyForSignUp])
    {        
        // Signup service call and next page
        [self performSegueWithIdentifier:@"SignUpSuccess"
                                  sender:self];
    }
}


@end
