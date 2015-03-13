//
//  BHMainMapViewController.m
//  DeliGuide
//
//  Created by AJ Green on 3/7/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHMainMapViewController.h"

#define CELL_HEIGHT 120.0f

@interface BHMainMapViewController ()

@end

@implementation BHMainMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.screenName = @"MAP";
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [[self tableView] setContentInset:UIEdgeInsetsMake(self.mapView.frame.size.height-CELL_HEIGHT, 0, 0, 0)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Magic
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y < self.mapView.frame.size.height*-1 )
    {
        [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, self.mapView.frame.size.height*-3)];
    }
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    return cell;
    
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
