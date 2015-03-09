//
//  BHMainMapViewController.m
//  DeliGuide
//
//  Created by AJ Green on 3/7/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHMainMapViewController.h"
#import "BHLocationManager.h"

@interface BHMainMapViewController ()

@end

@implementation BHMainMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[BHLocationManager locationManager] requestLocationServicesAuthorization];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Text Field Delegate
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    // Resign first responder
    [self.zipSearch resignFirstResponder];
    
    // Update the Map and locations
    return true;
}

#pragma mark - Map View Delegate

#pragma mark - Button Handlers
- (IBAction) handleFilterTouchUpInside:(id)sender
{
    
}

- (IBAction)handleViewListTouchUpInside:(id)sender
{
}

- (IBAction)handleUpdateLocationTouchUpInside:(id)sender
{
}

@end
