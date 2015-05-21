//
//  BHSatisfactionDislikeTableViewController.m
//  DeliGuide
//
//  Created by AJ Green on 5/21/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHSatisfactionDislikeTableViewController.h"
#import "BHDrawerBackgroundView.h"
#import "BHDislikeHeaderViewController.h"
#import "BHDislikeTableViewCell.h"
#import "BHPrimaryButton.h"

@interface BHSatisfactionDislikeTableViewController ()

@property (nonatomic, strong) NSArray *options;

@end

@implementation BHSatisfactionDislikeTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    BHDrawerBackgroundView *background = [[BHDrawerBackgroundView alloc] initWithFrame:self.tableView.frame];
    [[self tableView] setBackgroundView:background];
    
    self.options = @[@"Food", @"Cleanliness", @"Service", @"Boar's Head Products"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 120.0f;
}

- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    BHDislikeHeaderViewController *dislike = [[BHDislikeHeaderViewController alloc] initWithNibName:@"BHDislikeHeaderViewController"
                                                                                             bundle:nil];
    
    return dislike.view;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 120.0f;
}

- (UIView*) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.frame.size.width, 120.0f)];
    
    BHPrimaryButton *primary = [[BHPrimaryButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 280.0f, 55.0f)];
    
    [primary setTitle:@"Next" forState:UIControlStateNormal];
    [primary setAdjustsImageWhenHighlighted:YES];
    [primary addTarget:self
                action:@selector(handleNext)
      forControlEvents:UIControlEventTouchUpInside];
    
    [footer addSubview:primary];
    primary.center = [footer convertPoint:footer.center fromView:footer.superview];
    
    return footer;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.options.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BHDislikeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dislike"];
    
    // Configure the cell...
    if (cell == nil)
    {
        [tableView registerNib:[UINib nibWithNibName:@"BHDislikeCell" bundle:nil] forCellReuseIdentifier:@"dislike"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"dislike"];
    }
    
    NSString *option = [self.options objectAtIndex:indexPath.row];
    
    [[cell option] setText:option];
    
    return cell;
}


#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}


- (void) handleNext
{
    
}


@end
