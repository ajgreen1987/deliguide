//
//  BHLocationSearchTextField.m
//  DeliGuide
//
//  Created by AJ Green on 5/6/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHLocationSearchTextField.h"
#import "BHSearchFieldBackgroundView.h"

@implementation BHLocationSearchTextField

- (void) awakeFromNib
{
    [self setupRoundingEdges];
    [self setupLeftView];
    [self setupRightView];
}

- (void) setupRoundingEdges
{
    [self setBorderStyle:UITextBorderStyleNone];
    
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:15.0f];
    [self.layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [self.layer setBorderWidth:1];
    [self.layer setBackgroundColor:[UIColor whiteColor].CGColor];
}

- (void) setupLeftView
{
    [self setLeftViewMode:UITextFieldViewModeAlways];
    self.leftView = [self searchImageView];

}

- (void) setupRightView
{
    [self setRightViewMode:UITextFieldViewModeAlways];
    self.rightView = [self locationButton];
}

- (UIImageView*) searchImageView
{
    UIImageView *search = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f,
                                                                        0.0f,
                                                                        22.0f,
                                                                        16.0f)];
    [search setImage:self.searchImage];
    [search setContentMode:UIViewContentModeCenter];
    
    return search;
}

- (UIButton*) locationButton
{
    UIButton *userStatusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [userStatusButton setImage:self.buttonImage
                      forState:UIControlStateNormal];
    
    userStatusButton.frame=CGRectMake(0, 0, 30, 20);
    [userStatusButton addTarget:self
                         action:@selector(locationSelected)
               forControlEvents:UIControlEventTouchUpInside];

    return userStatusButton;
}

- (void) locationSelected
{
    if ((self.searchDelegate != nil) && [self.searchDelegate respondsToSelector:@selector(tappedLocationButton)])
    {
        [[self searchDelegate] tappedLocationButton];
    }
}


@end
