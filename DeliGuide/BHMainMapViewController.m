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

#define CELL_HEIGHT 136.0f

@interface BHMainMapViewController ()

@property (nonatomic, assign) BOOL isMapFullScreen;
@property (nonatomic, assign) CGFloat originalTableViewYOrigin;

- (void) handleProbableNavigationTrees;

@end

@implementation BHMainMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.screenName = @"MAP";
    self.title = @"Deli's Near Me";
    
    
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
    
    [[self tableView] setContentOffset:CGPointMake(0, -self.tableView.contentInset.top)];
    [[self tableView] setContentInset:UIEdgeInsetsMake(self.mapView.frame.size.height-(CELL_HEIGHT*2), 0, 0, 0)];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Initiailizers
- (void) setupCustomSearchBar
{
    [self.customSearchBar setShouldAutoShrink:YES];
    [self.customSearchBar setRightSideButtonTitle:@"FILTER"];
}

- (void) setupMap
{
    self.isMapFullScreen = NO;
    [self setupMapTapGestureRecognizer];
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
    [self enableMapFeatures:YES];
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
    cell.satisfactionPercentage.text = [NSString stringWithFormat:@"%.2f%% like",deli.satisfactionPercentage];
    
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
    for (BHDeliObject *deli in [[BHApplicationManager appManager] delis])
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

@end
