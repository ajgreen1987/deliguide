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
#import "FPPopoverController.h"
#import "BHSatisfactionDislikeTableViewController.h"
#import "BHDeliAnnotation.h"
#import "BHHoursTableViewController.h"
#import "BHMenuTableViewController.h"
#import "BHDetailsLikeViewController.h"
#import "BHLocationManager.h"
#import "BHEasyWayServicesManager.h"

@interface BHDeliDetailsTableViewController ()

@property (nonatomic, assign) CGPoint lastContentOffset;

@end

@implementation BHDeliDetailsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupMap];
    [self setupFonts];
    [self setupDeliDetails];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self transparentNavBar];

}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    [self normalNavBar];
}

- (void) transparentNavBar
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
}

- (void) normalNavBar
{
    
    [self.navigationController.navigationBar setBackgroundImage:nil
                                                  forBarMetrics:UIBarMetricsDefault];
}

- (void) scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    [self transparentNavBar];
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint currentOffset = scrollView.contentOffset;
    
    if (currentOffset.y > self.lastContentOffset.y)
    {
        // Downward
        [self transparentNavBar];
    }
    else
    {
        // Upward
        [self normalNavBar];
    }
    
    self.lastContentOffset = currentOffset;
}

- (void) setupFonts
{
    [self.deliName setFont:AppFontSabonRomanSC(22.0f)];
    [[self.call titleLabel] setFont:AppFontSabonRomanSC(15.0f)];
    [[self.directions titleLabel] setFont:AppFontSabonRomanSC(15.0f)];
    [[self.order titleLabel] setFont:AppFontSabonRomanSC(15.0f)];
    [[self.favorites titleLabel] setFont:AppFontSabonRomanSC(22.0f)];
    [[self.deliWebsite titleLabel] setFont:AppFontSabonRomanSC(18.0f)];
    [[self.facebook titleLabel] setFont:AppFontSabonRomanSC(18.0f)];
}

- (void) setupDeliDetails
{
    [self.deliName setText:self.currentDeli.deliName];
    [self.deliAddress setText:self.currentDeli.deliDisplayAddress];
    [self.takeOut setText:self.currentDeli.isTakeoutAvailable ? @"Yes" : @"No"];
    [self.delivery setText:self.currentDeli.isDeliveryAvailable ? @"Yes" : @"No"];
    [self.paymentOptions setText:[self.currentDeli.paymentMethods componentsJoinedByString:@", "]];
    [self.percentage setText:[NSString stringWithFormat:@"%.0f%%",self.currentDeli.satisfactionPercentage]];
    [self.openOrClosed setText:[BHApplicationManager isDeliOpenOrClosed:self.currentDeli]];
    [self.deliHours setTitle:[NSString stringWithFormat:@"Hours: %@", [self.currentDeli.deliHours objectForKey:[BHApplicationManager today] ]] forState:UIControlStateNormal];

}

#pragma mark - map

- (void) setupMap
{
    [self.mapview setDelegate:self];
    

    BHDeliAnnotation *annotation = [[BHDeliAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(self.currentDeli.latitude, self.currentDeli.longitude)];
    [self.mapview addAnnotation:annotation];
    
    [self zoomMapViewToFitAnnotationsWithExtraZoomToAdjust:0];
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
        annotationView.image = [UIImage imageNamed:@"pin-selected.png"];
        return annotationView;
    }
    return nil;
}

- (void)zoomMapViewToFitAnnotationsWithExtraZoomToAdjust:(double)extraZoom
{
    if ([self.mapview.annotations count] == 0) return;
    
    int i = 0;
    MKMapPoint points[[self.mapview.annotations count]];
    
    for (id<MKAnnotation> annotation in self.mapview.annotations)
    {
        points[i++] = MKMapPointForCoordinate(annotation.coordinate);
    }
    
    MKPolygon *poly = [MKPolygon polygonWithPoints:points count:i];
    
    MKCoordinateRegion r = MKCoordinateRegionForMapRect([poly boundingMapRect]);
    r.span.latitudeDelta += extraZoom;
    r.span.longitudeDelta += extraZoom;
    
    [self.mapview setRegion: r animated:YES];
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
    [BHApplicationManager callLocation:self.currentDeli.phoneNumber];
}

- (IBAction)handleDirectionsTouchUpInside:(id)sender
{
    CLLocation *deliLocation = [[CLLocation alloc] initWithLatitude:self.currentDeli.latitude
                                                          longitude:self.currentDeli.longitude];
    CLLocation *userLocation = [[CLLocation alloc] initWithLatitude:[[[BHApplicationManager appManager] currentUser] latitude]
                                                          longitude:[[[BHApplicationManager appManager] currentUser] longitude]];
    
    [BHEasyWayServicesManager getDirectionsFromLocation:userLocation
                                             toLocation:deliLocation];
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

- (IBAction)handleLikeTouchUpInside:(id)sender
{
    UIButton *like = (UIButton*)sender;
    if (![like isSelected])
    {
        [self.percentage setText:@"81 %"];
        [like setSelected:!like.isSelected];
        [self.dislike setEnabled:YES];
        [self.dislike setSelected:NO];
        
        BHDetailsLikeViewController *likeController = [[BHDetailsLikeViewController alloc] initWithNibName:@"BHDetailsLikeViewController"
                                                                                                    bundle:nil];
        [likeController setTitle:nil];

        //our popover
        FPPopoverController *popover = [[FPPopoverController alloc] initWithViewController:likeController];
        
        [popover setContentSize:CGSizeMake(292,152)];
        [popover setTint:FPPopoverWhiteTint];
        [popover setBorder:NO];
        
        //the popover will be presented from the okButton view
        [popover presentPopoverFromView:self.like];
    }
}

- (IBAction)handleDislikeTouchUpInside:(id)sender
{
    UIButton *dislike = (UIButton*)sender;
    
    if (![dislike isSelected])
    {
        [self.percentage setText:@"62 %"];        
        
        [dislike setSelected:!dislike.isSelected];
        [self.like setEnabled:YES];
        [self.like setSelected:NO];
        

        BHSatisfactionDislikeTableViewController *dislike = [[BHSatisfactionDislikeTableViewController alloc] initWithNibName:@"BHSatisfactionDislikeTableViewController"
                                                                                                                       bundle:nil];
        
        [self presentSemiViewController:dislike];
    }
}

- (IBAction)handleAddToFavoritesTouchUpInside:(id)sender
{
    UIButton *favorite = (UIButton*)sender;
    
    [favorite setSelected:!favorite.isSelected];
    [favorite setBackgroundColor:favorite.isSelected?GOLD_1:[UIColor clearColor]];
}

- (IBAction)handleDeliWebsiteTouchUpInside:(id)sender
{
    [BHApplicationManager browserForURL:self.currentDeli.website];
}

- (IBAction)handleFacebookTouchUpInside:(id)sender
{
    // Launch FB
}

#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:HOURS_SEGUE])
    {
        // Get reference to the destination view controller
        BHHoursTableViewController *vc = [segue destinationViewController];
        
        // This is fucking awful, referencing the UI element instead of the data object...AJ
        [vc setHours:[self.currentDeli deliHours]];
        [vc setTitle:[self.currentDeli deliName]];
    }
    else if([[segue identifier] isEqualToString:MENU_SEGUE])
    {
        // Get reference to the destination view controller
        BHMenuTableViewController *vc = [segue destinationViewController];
        
        // #oopsIDidItAgain
        [vc setTitle:[self.deliName text]];
    }
}

- (void) setupNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleSatisfactionNoThanks)
                                                 name:@"LikeNoThanks"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleSatisfactionNoThanks)
                                                 name:@"LikeShare"
                                               object:nil];
}

- (void) handleSatisfactionNoThanks
{
    //[_popover performSelector:@selector(dismiss) withObject:nil afterDelay:0.5f];
}

- (void) handleSatisfactionShareIt
{
    
}

@end
