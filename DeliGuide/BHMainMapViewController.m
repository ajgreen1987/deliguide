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
#import "BHDeliAnnotation.h"
#import "BHDeliDetailsTableViewController.h"

#define CELL_HEIGHT 136.0f

@interface BHMainMapViewController ()

@property (nonatomic, assign) BOOL isMapFullScreen;
@property (nonatomic, assign) CGFloat originalTableViewYOrigin;
@property (nonatomic, assign) NSInteger selectedIndex;

- (void) handleProbableNavigationTrees;

@end

@implementation BHMainMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.screenName = @"MAP";
}

- (void) viewWillAppear:(BOOL)animated
{
    [self setupCustomSearchBar];
    [self setupMap];
    [self setupTableView];
    [self handleProbableNavigationTrees];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    //[[self tableView] setContentOffset:CGPointMake(0, -self.tableView.contentInset.top)];

    CGFloat topInset = ([[self delisToDisplay]count]>1) ? self.mapView.frame.size.height-(CELL_HEIGHT*2) : self.view.bounds.size.height - (CELL_HEIGHT*1.75);
    [[self tableView] setContentInset:UIEdgeInsetsMake(topInset, 0, 0, 0)];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Initiailizers
- (void) setupCustomSearchBar
{
    [self.customSearchBar setHidden:([self.delisToDisplay count] < 2)];
    [self.customSearchBar setShouldAutoShrink:YES];
    [self.customSearchBar setRightSideButtonTitle:@"FILTER"];
}

- (void) setupMap
{
    self.isMapFullScreen = NO;
    [self setupMapTapGestureRecognizer];
    [self setupMapSwipeGestureRecognizer];
    [self enableMapFeatures:self.isMapFullScreen];
    [[BHLocationManager locationManager] setLocationManagerDelegate:self];
    [[BHLocationManager locationManager] requestLocationServicesAuthorization];
    [self enableMapFeatures:NO];
}

- (void) enableMapFeatures:(BOOL)shouldBeEnabled
{
    [[self mapView] setScrollEnabled:shouldBeEnabled];
    [[self mapView] setZoomEnabled:shouldBeEnabled];
}

- (void) setupTableView
{
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.originalTableViewYOrigin = self.tableView.frame.origin.y;
}

#pragma mark - Navigation
- (void) handleProbableNavigationTrees
{
    if ([[BHApplicationManager appManager] shouldSignIn])
    {
        [[BHApplicationManager appManager] setShouldSignIn:NO];
        
        [self performSegueWithIdentifier:@"SignIn"
                                  sender:self];
    }
    else if ([[BHApplicationManager appManager] shouldSignUp])
    {
        [[BHApplicationManager appManager] setShouldSignUp:NO];
        
        [self performSegueWithIdentifier:@"SignUp"
                                  sender:self];
    }
}

#pragma mark - Table View Magic
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{    
    if (scrollView.contentOffset.y < self.mapView.frame.size.height*-1 )
    {
        [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, self.mapView.frame.size.height*-3)];
    }
}

#pragma mark - Map Gesture Recognizers
- (void) setupMapSwipeGestureRecognizer
{
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleMapSwipe:)];
    [swipeGesture setDirection:(UISwipeGestureRecognizerDirectionDown | UISwipeGestureRecognizerDirectionUp)];
    
    [self.mapView addGestureRecognizer:swipeGesture];
}

- (void) setupMapTapGestureRecognizer
{
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleMapTapGesture:)];
    tgr.numberOfTapsRequired = 1;

    
    [self.mapView addGestureRecognizer:tgr];
}

- (void) handleMapSwipe:(UISwipeGestureRecognizer*) gestureRecognizer
{
    [self handleMapAndTableViewToggle];
}

- (void)handleMapTapGesture:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded)
        return;
    
    if (!self.isMapFullScreen)
    {
        [self handleMapAndTableViewToggle];
    }
}

- (void) handleMapAndTableViewToggle
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
    [self enableMapFeatures:self.isMapFullScreen];
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.delisToDisplay count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BHDeliTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    BHDeliObject *deli = (BHDeliObject*)[self.delisToDisplay objectAtIndex:indexPath.row];
    
    cell.deliName.text = deli.deliName;
    cell.address.text = deli.deliDisplayAddress;
    cell.satisfactionPercentage.text = [NSString stringWithFormat:@"%.1f%% like",deli.satisfactionPercentage];
    cell.featured.hidden = !deli.isFeatured;
    cell.openOrClosed.text = [BHApplicationManager isDeliOpenOrClosed:deli];
    
    cell.travelDistance.text = [self stringForDelisTransporationModes:[deli deliTravelTimes]];
    
    return cell;
    
}

#pragma mark - UITableView Delegate
- (void) tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.selectedIndex = indexPath.row;
    
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    
    [self performSegueWithIdentifier:@"DetailsSegue"
                              sender:self];
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
}

- (void) zoomToUserLocation:(CLLocation*)aLocation
{
    for (BHDeliObject *deli in self.delisToDisplay)
    {
        BHDeliAnnotation *annotation = [[BHDeliAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(deli.latitude, deli.longitude)];

        [self.mapView addAnnotation:annotation];
    }
    
    [self zoomMapViewToFitAnnotationsWithExtraZoomToAdjust:0];
}

- (void)zoomMapViewToFitAnnotationsWithExtraZoomToAdjust:(double)extraZoom
{
    if ([self.mapView.annotations count] == 0) return;
    
    int i = 0;
    MKMapPoint points[[self.mapView.annotations count]];
    
    for (id<MKAnnotation> annotation in self.mapView.annotations)
    {
        points[i++] = MKMapPointForCoordinate(annotation.coordinate);
    }
    
    MKPolygon *poly = [MKPolygon polygonWithPoints:points count:i];
    
    MKCoordinateRegion r = MKCoordinateRegionForMapRect([poly boundingMapRect]);
    r.span.latitudeDelta += extraZoom;
    r.span.longitudeDelta += extraZoom;
    
    [self.mapView setRegion: r animated:YES];
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
- (IBAction)handleViewListTouchUpInside:(id)sender
{
    [self handleMapAndTableViewToggle];
}

- (IBAction)handleUpdateLocationTouchUpInside:(id)sender
{
}

#pragma mark - Map Delegate
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    static NSString* AnnotationIdentifier = @"AnnotationIdentifier";
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationIdentifier];
    if(annotationView)
        return annotationView;
    else
    {
        MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation
                                                                         reuseIdentifier:AnnotationIdentifier];
        annotationView.image = [UIImage imageNamed:@"pin.png"];
        return annotationView;
    }
    return nil;
}

- (NSString*) stringForDelisTransporationModes:(NSMutableArray*)modes
{
    int userMode = [[[BHApplicationManager appManager] currentUser] currentMode];
    
    for (BHTravelObject *transportation in modes)
    {
        if ([transportation travelMode] == userMode)
        {
            return [NSString stringWithFormat:@"%.0f min %@",[transportation travelTime], [transportation travelString]];
        }
    }
    
    return @"";
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:DETAILS_SEGUE])
    {
        BHDeliObject *deli = (BHDeliObject*)[self.delisToDisplay objectAtIndex:self.selectedIndex];
        
        // Get reference to the destination view controller
        BHDeliDetailsTableViewController *vc = [segue destinationViewController];
        
        [vc setCurrentDeli:deli];
    }

}

@end
