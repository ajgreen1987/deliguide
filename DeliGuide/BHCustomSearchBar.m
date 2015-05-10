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

@interface BHCustomSearchBar ()

@property (nonatomic, strong) BHLocationSearchTextField *textField;
@property (nonatomic, strong) UIButton *cancel;

@end

@implementation BHCustomSearchBar

- (void) awakeFromNib
{
    [self setupTextfield];
    [self setupCancel];
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

- (void) setupCancel
{
    self.cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.cancel setFrame:CGRectMake(0.0f,
                                     0.0f,
                                     75.0f,
                                     30.0f)];
    [self.cancel setAlpha:0.0f];
    [self.cancel setAdjustsImageWhenHighlighted:YES];
    [self.cancel addTarget:self
                    action:@selector(handleCancelTouchUpInside)
          forControlEvents:UIControlEventTouchUpInside];
    [self.cancel setTitle:@"CANCEL" forState:UIControlStateNormal];
    [self.cancel setTitleColor:GOLD_1 forState:UIControlStateNormal];
    [self.cancel setCenter:CGPointMake(self.bounds.size.width - (self.cancel.frame.size.width*0.55f),
                                       self.bounds.size.height*0.5f)];
    
    [self addSubview:self.cancel];
}

- (void) handleCancelTouchUpInside
{
    [UIView animateWithDuration:0.2f
                     animations:^{
                         [self.cancel setAlpha:0.0f];
                     }];
    
    [self.textField handleCancel];
}

#pragma mark - Search Delegate
- (void) didStartEditing
{
    [UIView animateWithDuration:0.2f
                     animations:^{
                         [self.cancel setAlpha:1.0f];
                     }];
    
    [self dimOtherViewsToAlpha:0.4f];
}

- (void) didCancelEditing
{
    [self dimOtherViewsToAlpha:1.0f];
}

- (void) tappedLocationButton
{
    
}



@end
