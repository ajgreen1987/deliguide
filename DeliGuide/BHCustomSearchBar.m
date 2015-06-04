//
//  BHCustomSearchBar.m
//  DeliGuide
//
//  Created by AJ Green on 5/10/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHCustomSearchBar.h"
#import "BHLocationSearchTextField.h"

#define BLACK_NAV_TAG       111001
#define CANCEL_TITLE        @"CANCEL"

@interface BHCustomSearchBar ()

@property (nonatomic, strong) BHLocationSearchTextField *textField;
@property (nonatomic, strong) UIButton *rightSideButton;

- (BOOL) isRightSideACancelButton;

@end

@implementation BHCustomSearchBar

- (void) awakeFromNib
{
    [self setupFromBeginning];
}

- (void) setupFromBeginning
{
    [self setupTextfield];
    [self setupRightSideButton];
}

- (void) dimOtherViewsToAlpha:(CGFloat)alpha
{
    UIViewController *parent = UIViewParentController(self);
    UINavigationController *parentNavigationController = [parent navigationController];
    
    if (parent != nil)
    {
        if (parentNavigationController != nil)
        {
            UINavigationBar *parentNavBar = [parentNavigationController navigationBar];
            UIView *blackView = [parentNavBar viewWithTag:BLACK_NAV_TAG];
            
            if (blackView == nil)
            {
                
                blackView = [[UIView alloc] initWithFrame:[parentNavBar frame]];
                [blackView setTag:BLACK_NAV_TAG];
                [blackView setCenter:CGPointMake(parentNavBar.frame.size.width*0.5f,
                                                 parentNavBar.frame.size.height*0.5f)];
                [blackView setBackgroundColor:[UIColor blackColor]];
                [blackView setAlpha:0.5f];
                
                [parentNavBar addSubview:blackView];
            }
            else
            {
                [blackView removeFromSuperview];
            }
        }
        
        for (UIView *view in [[parent view] subviews])
        {
            if (![view isEqual:self])
            {
                [view setAlpha:alpha];
            }
        }
    }
}

- (void) setupTextfield
{
    self.textField = [[BHLocationSearchTextField alloc] initWithFrame:CGRectMake(0.0f,
                                                                                 0.0f,
                                                                                 self.frame.size.width*0.9f,
                                                                                 30.0f)
                      
                                                          searchImage:self.searchImage
                                                       andButtonImage:self.buttonImage];
    
    [self.textField setSearchDelegate:self];
    
    [self.textField setCenter:CGPointMake(self.bounds.size.width*0.5f,
                                          self.bounds.size.height*0.5f)];
    
    [self addSubview:self.textField];
}

- (void) setupRightSideButton
{
    self.rightSideButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightSideButtonTitle = CANCEL_TITLE;
    
    [self.rightSideButton setFrame:CGRectMake(0.0f,
                                     0.0f,
                                     75.0f,
                                     30.0f)];
    [self.rightSideButton setAlpha:0.0f];
    [self.rightSideButton setAdjustsImageWhenHighlighted:YES];
    [self.rightSideButton addTarget:self
                    action:@selector(handleRightSideButtonTouchUpInside)
          forControlEvents:UIControlEventTouchUpInside];
    [self.rightSideButton setTitle:self.rightSideButtonTitle
                          forState:UIControlStateNormal];
    [self.rightSideButton setTitleColor:GOLD_1 forState:UIControlStateNormal];
    [[self.rightSideButton titleLabel] setFont:AppFontSabonRomanSC(15.0f)];
    [self.rightSideButton setCenter:CGPointMake(self.bounds.size.width - (self.rightSideButton.frame.size.width*0.55f),
                                       self.bounds.size.height*0.5f)];
    
    [self addSubview:self.rightSideButton];
}

- (void) handleRightSideButtonTouchUpInside
{
    if ([self isRightSideACancelButton])
    {
        [UIView animateWithDuration:0.2f
                         animations:^{
                             [self.rightSideButton setAlpha:0.0f];
                         }];
        
        [self.textField handleCancel];
    }
    else
    {
        if ([[self customSearchDelegate] respondsToSelector:@selector(customSearchbarTouchedRightButton:)])
        {
            [[self customSearchDelegate] customSearchbarTouchedRightButton:self.rightSideButton];
        }
    }
}

#pragma mark - Search Delegate
- (void) didStartEditing
{
    [UIView animateWithDuration:0.2f
                     animations:^{
                         [self.rightSideButton setAlpha:1.0f];
                     }];
    
    [self dimOtherViewsToAlpha:0.4f];
}

- (void) didEndEditing
{
    //[self handleRightSideButtonTouchUpInside];
    
    if ([[self customSearchDelegate] respondsToSelector:@selector(customSearchbarDidFinishedEditing:)])
    {
        [[self customSearchDelegate] customSearchbarDidFinishedEditing:self.textField.text];
    }
}

- (void) didCancelEditing
{
    [self dimOtherViewsToAlpha:1.0f];
}

- (void) tappedLocationButton
{
    if ([[self customSearchDelegate] respondsToSelector:@selector(customSearchbarTouchedUserLocation)])
    {
        [[self customSearchDelegate] customSearchbarTouchedUserLocation];
    }
}

- (BOOL) isRightSideACancelButton
{
    return [self.rightSideButtonTitle isEqualToString:CANCEL_TITLE];
}

- (void) setRightSideButtonTitle:(NSString *)rightSideButtonTitle
{
    _rightSideButtonTitle = rightSideButtonTitle;
    [self.rightSideButton setTitle:_rightSideButtonTitle
                          forState:UIControlStateNormal];
}

- (void) setShouldAutoShrink:(BOOL)shouldAutoShrink
{
    _shouldAutoShrink = shouldAutoShrink;
    
    
}


@end
