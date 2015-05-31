//
//  BHHoursTableViewController.m
//  DeliGuide
//
//  Created by AJ Green on 5/21/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHHoursTableViewController.h"

@interface BHHoursTableViewController ()

@end

@implementation BHHoursTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupHours];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setupHours
{
    [[self sundayHours] setText:[self.hours objectForKey:@"Sunday"]];
    [[self mondayHours] setText:[self.hours objectForKey:@"Monday"]];
    [[self tuesdayHours] setText:[self.hours objectForKey:@"Tuesday"]];
    [[self wednesdayHours] setText:[self.hours objectForKey:@"Wednesday"]];
    [[self thursdayHours] setText:[self.hours objectForKey:@"Thursday"]];
    [[self fridayHours] setText:[self.hours objectForKey:@"Friday"]];
    [[self saturdayHours] setText:[self.hours objectForKey:@"Saturday"]];
}

@end
