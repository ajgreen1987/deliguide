//
//  BHDeliDetailsTravelTableViewController.m
//  DeliGuide
//
//  Created by AJ Green on 5/21/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHDeliDetailsTravelTableViewController.h"
#import "BHDrawerBackgroundView.h"

@interface BHDeliDetailsTravelTableViewController ()

@property (nonatomic, assign) NSInteger selectedRow;

@end

@implementation BHDeliDetailsTravelTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    BHDrawerBackgroundView *background = [[BHDrawerBackgroundView alloc] initWithFrame:self.tableView.frame];
    [[self tableView] setBackgroundView:background];
    
    self.travel = @{@"Walking":@"15 minutes",@"Biking":@"5 minutes", @"Driving":@"19 mintues",@"Public transit":@"32 minutes"};
    
    self.selectedRow = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.travel.allKeys.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.0f;
}

- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.frame.size.width, 50.0f)];
    
    [label setText:@"Choose your preferred mode of travel"];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:AppFontAvenirRegular(22.0f)];
    
    return label;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    // Configure the cell...
    if (cell == nil)
    {
        [tableView registerNib:[UINib nibWithNibName:@"BHTravelSelectionCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
    
    NSString *key = [[self.travel allKeys] objectAtIndex:indexPath.row];
    NSString *value = [self.travel objectForKey:key];
    
    if (indexPath.row != 0)
    {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    [[cell textLabel] setText:key];
    [[cell detailTextLabel] setText:value];
    
    return cell;
}

#pragma mark - Table view delegate
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *oldIndex = [self.tableView indexPathForSelectedRow];
    if (oldIndex ==nil)
    {
        oldIndex = [NSIndexPath indexPathForRow:0 inSection:0];
    }
    
    [self.tableView cellForRowAtIndexPath:oldIndex].accessoryType = UITableViewCellAccessoryNone;
    [self.tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    return indexPath;
}

@end