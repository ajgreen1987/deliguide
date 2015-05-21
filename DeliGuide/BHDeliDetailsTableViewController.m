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
#import "UIViewController+KNSemiModal.h"
#import "BHDeliDetailsTravelTableViewController.h"

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

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:nil
                                                  forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 6;
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
}

- (IBAction)handleOrderTouchUpInside:(id)sender
{
    // Display Order screen
    UIViewController *toPush = [[UIViewController alloc] init];
    
    [[self navigationController] pushViewController:toPush
                                           animated:YES];
}

- (IBAction)handleTravelTimeTouchUpInside:(id)sender
{
    BHDeliDetailsTravelTableViewController *travel = [[BHDeliDetailsTravelTableViewController alloc] initWithNibName:@"BHDeliDetailsTravelTableViewController" bundle:nil];
    
    [self presentSemiViewController:travel];
}

- (IBAction)handleHoursTouchUpInside:(id)sender {
}

- (IBAction)handleViewMenuTouchUpInside:(id)sender {
}

- (IBAction)handleLikeTouchUpInside:(id)sender {
}

- (IBAction)handleDislikeTouchUpInside:(id)sender {
}

- (IBAction)handleAddToFavoritesTouchUpInside:(id)sender {
}

- (IBAction)handleDeliWebsiteTouchUpInside:(id)sender {
}

- (IBAction)handleFacebookTouchUpInside:(id)sender {
}
@end
