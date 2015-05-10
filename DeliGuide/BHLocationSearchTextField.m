//
//  BHLocationSearchTextField.m
//  DeliGuide
//
//  Created by AJ Green on 5/6/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHLocationSearchTextField.h"
#import "BHSearchFieldBackgroundView.h"

@interface BHLocationSearchTextField ()

@property (nonatomic, assign) CGFloat originalWidth;

@end

@implementation BHLocationSearchTextField

- (void) awakeFromNib
{
    [self setDelegate:self];
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
    if([self isSearchDelegateValidForSelector:@selector(tappedLocationButton)])
    {
        [[self searchDelegate] tappedLocationButton];
    }
}

- (void) textFieldDidBeginEditing:(UITextField *)textField
{

    self.originalWidth = self.frame.size.width;
     __block BHLocationSearchTextField *blocksafeSelf = self;
    
    [UIView animateWithDuration:0.1f
                     animations:^{
                         
                         blocksafeSelf.frame = CGRectMake(blocksafeSelf.frame.origin.x,
                                                 blocksafeSelf.frame.origin.y,
                                                 blocksafeSelf.frame.size.width * .76f,
                                                 blocksafeSelf.frame.size.height);
                         
                     }
                     completion:^(BOOL finished)
     {
         blocksafeSelf.frame = CGRectMake(blocksafeSelf.frame.origin.x,
                                 blocksafeSelf.frame.origin.y,
                                 blocksafeSelf.frame.size.width * .76f,
                                 blocksafeSelf.frame.size.height);
         
         if ([blocksafeSelf isSearchDelegateValidForSelector:@selector(didStartEditing)])
         {
             [[NSNotificationCenter defaultCenter] addObserver:blocksafeSelf
                                                      selector:@selector(handleCancel)
                                                          name:CANCEL_LOC_SEARCH
                                                        object:nil];
             [[blocksafeSelf searchDelegate] didStartEditing];
         }
     }
     ];
}

- (BOOL) isSearchDelegateValidForSelector:(SEL)aSelector
{
    return ((self.searchDelegate != nil) && [self.searchDelegate respondsToSelector:aSelector]);
}

- (void) handleCancel
{
    __block BHLocationSearchTextField *blocksafeSelf = self;
    
    [UIView animateWithDuration:0.1f
                     animations:^{
                         
                         blocksafeSelf.frame = CGRectMake(blocksafeSelf.frame.origin.x,
                                                 blocksafeSelf.frame.origin.y,
                                                 blocksafeSelf.originalWidth,
                                                 blocksafeSelf.frame.size.height);
                         
                     }
                     completion:^(BOOL finished)
     {
         blocksafeSelf.frame = CGRectMake(blocksafeSelf.frame.origin.x,
                                 blocksafeSelf.frame.origin.y,
                                 blocksafeSelf.originalWidth,
                                 blocksafeSelf.frame.size.height);

         [blocksafeSelf resignFirstResponder];
         
         if ([blocksafeSelf isSearchDelegateValidForSelector:@selector(didCancelEditing)])
         {
             [[NSNotificationCenter defaultCenter] removeObserver:blocksafeSelf
                                                             name:CANCEL_LOC_SEARCH
                                                           object:blocksafeSelf];
             [[blocksafeSelf searchDelegate] didCancelEditing];
         }
     }
     ];
}


@end
