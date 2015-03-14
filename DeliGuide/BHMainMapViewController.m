//
//  BHMainMapViewController.m
//  DeliGuide
//
//  Created by AJ Green on 3/7/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHMainMapViewController.h"
#import "BHDeliTableViewCell.h"

#define CELL_HEIGHT 136.0f

@interface BHMainMapViewController ()

@property (nonatomic, assign) BOOL isMapFullScreen;

@end

@implementation BHMainMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.screenName = @"MAP";
    [self setupMap];
    [self setupTableView];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [[self tableView] setContentOffset:CGPointMake(0, -self.tableView.contentInset.top)];
    [[self tableView] setContentInset:UIEdgeInsetsMake(self.mapView.frame.size.height-(CELL_HEIGHT*2), 0, 0, 0)];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Initiailizers
- (void) setupMap
{
    self.isMapFullScreen = NO;
    [self setupMapTapGestureRecognizer];
}

- (void) setupTableView
{
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - Table View Magic
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y < self.mapView.frame.size.height*-1 )
    {
        [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, self.mapView.frame.size.height*-3)];
    }
}

#pragma mark - Map Tap Recognizer
- (void) setupMapTapGestureRecognizer
{
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleMapTapGesture:)];
    tgr.numberOfTapsRequired = 1;

    
    [self.mapView addGestureRecognizer:tgr];
}


- (void)handleMapTapGesture:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded)
        return;
    
    if (!self.isMapFullScreen)
    {
        // Animate the list view off the page
        self.isMapFullScreen = !self.isMapFullScreen;
    }
    
    
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BHDeliTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.travelDistance.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    return cell;
    
}

#pragma mark - UITableView Delegate
- (void) tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    
    [self performSegueWithIdentifier:@"DetailsSegue"
                              sender:self];
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
