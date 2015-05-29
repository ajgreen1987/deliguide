//
//  BHDetailsLikeViewController.m
//  DeliGuide
//
//  Created by AJ Green on 5/21/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHDetailsLikeViewController.h"

@interface BHDetailsLikeViewController ()

@end

@implementation BHDetailsLikeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Buttons
- (IBAction) handleNoThanksTapped:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LikeNoThanks"
                                                        object:nil];
}

- (IBAction) handleShareItTapped:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LikeShare"
                                                        object:nil];
}

@end
