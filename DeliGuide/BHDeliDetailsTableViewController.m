//
//  BHDeliDetailsTableViewController.m
//  DeliGuide
//
//  Created by AJ Green on 3/15/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHDeliDetailsTableViewController.h"
#import "BHApplicationManager.h"
#import "BHLocationManager.h"
#import <CoreLocation/CoreLocation.h>

@interface BHDeliDetailsTableViewController ()

@end

@implementation BHDeliDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    return cell;
}

- (IBAction)handleCallLocationTouchUpInside:(id)sender
{
    [BHApplicationManager callLocation:@"(804) 222-1111"];
}

- (IBAction)handleDirectionsTouchUpInside:(id)sender
{
    CLLocation *location = [[CLLocation alloc] initWithLatitude:29.33891 longitude:48.077202];
    CLLocation *anotherLocation = [[CLLocation alloc] initWithLatitude:37.33120 longitude:48.077202];
    
    /*[BHLocationManager getDirectionsFromLocation:location
                                      toLocation:anotherLocation];*/
}

- (IBAction)handleOrderTouchUpInside:(id)sender
{
    // Display Order screen
}
@end
