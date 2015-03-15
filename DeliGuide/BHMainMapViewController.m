//
//  BHMainMapViewController.m
//  DeliGuide
//
//  Created by AJ Green on 3/7/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHMainMapViewController.h"
#import "BHApplicationManager.h"
#import "BHDeliTableViewCell.h"
#import "BHDeliObject.h"

#define CELL_HEIGHT 136.0f

@interface BHMainMapViewController ()

@property (nonatomic, assign) BOOL isMapFullScreen;
@property (nonatomic, assign) CGFloat originalTableViewYOrigin;

@end

@implementation BHMainMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.screenName = @"MAP";
    [self setupMap];
    [self setupTableView];
    
    // Mock Locations for now
    [[BHApplicationManager appManager] setupMockDelis];
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
    
    [[BHLocationManager locationManager] setLocationManagerDelegate:self];
    [[BHLocationManager locationManager] startUpdatingUserLocation];
}

- (void) setupTableView
{
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.originalTableViewYOrigin = self.tableView.frame.origin.y;
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
        [self animateTableViewYOrigin];
    }
}

- (void)animateTableViewYOrigin
{
    CGFloat tableViewYOrigin = self.isMapFullScreen ? self.originalTableViewYOrigin : self.view.frame.size.height;
    // Animate the list view off the page
    [UIView animateWithDuration:0.6f
                     animations:^{
                         [self.tableView setFrame:CGRectMake(self.tableView.frame.origin.x,
                                                             tableViewYOrigin,
                                                             self.tableView.frame.size.width,
                                                             self.tableView.frame.size.height)];
                     }];
    self.isMapFullScreen = !self.isMapFullScreen;
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BHApplicationManager appManager] delis] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BHDeliTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    BHDeliObject *deli = (BHDeliObject*)[[[BHApplicationManager appManager] delis] objectAtIndex:indexPath.row];
    
    cell.deliName.text = deli.deliName;
    cell.address.text = deli.deliDisplayAddress;
    cell.satisfactionPercentage.text = [NSString stringWithFormat:@"%.2f LIKE",deli.satisfactionPercentage];
    
    cell.travelDistance.text = [NSString stringWithFormat:@"%ld min",(long)indexPath.row];
    
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

#pragma mark - Location Delegate
- (void) userAllowedPermission
{
    if (!self.mapView.showsUserLocation)
    {
        [self.mapView setShowsUserLocation:YES];
        
        [self zoomToUserLocation:self.mapView.userLocation.location];
    }
}

- (void) userDeniedPermission
{
    [self presentGPSPermissionDeniedAlert];
}

- (void) didUpdateUserLocationFromLocation:(CLLocation *)anOldLocation toLocation:(CLLocation *)aNewLocation
{
    [self zoomToUserLocation:aNewLocation];
}

- (void) zoomToUserLocation:(CLLocation*)aLocation
{
    /*
    MKCoordinateRegion region;
    region.center = aLocation.coordinate;
    region.span = MKCoordinateSpanMake(0.1, 0.1);
    
    region = [self.mapView regionThatFits:region];
    [self.mapView setRegion:region animated:YES];
     */
}

#pragma mark - Alert Views
-(void)presentGPSUnavailableAlert
{
    [BHLocationManager presentGPSUnavailableAlertForController:self];
}

-(void)presentGPSPermissionDeniedAlert
{
    [BHLocationManager presentGPSPermissionDeniedAlertForController:self];
}

-(void)presentNoConnectionAlert
{
    [BHLocationManager presentNoConnectionAlertForController:self];
}

#pragma mark - Button Handlers
- (IBAction) handleFilterTouchUpInside:(id)sender
{
    
}

- (IBAction)handleViewListTouchUpInside:(id)sender
{
    [self animateTableViewYOrigin];
}

- (IBAction)handleUpdateLocationTouchUpInside:(id)sender
{
}

@end
