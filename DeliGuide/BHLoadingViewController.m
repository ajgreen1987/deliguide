//
//  BHLoadingViewController.m
//  DeliGuide
//
//  Created by AJ Green on 3/12/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHLoadingViewController.h"
#import "BHLocationManager.h"

@implementation BHLoadingViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    self.screenName = @"Loading";
}

- (IBAction)handleLocationTouchUpInside:(id)sender
{
    [[BHLocationManager locationManager] requestLocationServicesAuthorization];
}

@end
