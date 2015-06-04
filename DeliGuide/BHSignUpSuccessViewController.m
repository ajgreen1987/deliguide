//
//  BHSignUpSuccessViewController.m
//  DeliGuide
//
//  Created by AJ Green on 5/9/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHSignUpSuccessViewController.h"
#import "BHApplicationManager.h"
#import "BHMockDataManager.h"

@interface BHSignUpSuccessViewController ()

@end

@implementation BHSignUpSuccessViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.screenName = @"SIGNUPSUCCESS";
    
    [[BHApplicationManager appManager] setUserSignedIn:YES];
    [[BHApplicationManager appManager] setCurrentUser:[BHMockDataManager mockUser]];
    [BHApplicationManager writeString:@"USER_ID"
                 toUserDefaultsForKey:USER_ID_KEY];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    [[self navigationItem] setHidesBackButton:YES];
}

- (IBAction) handleLikeUsTouchUpInside:(id)sender
{
    
}

- (IBAction) handleDoneTouchUpInside:(id)sender;
{
    [[self navigationController] popToRootViewControllerAnimated:YES];
}

@end
