//
//  BHMainMapViewController.h
//  DeliGuide
//
//  Created by AJ Green on 3/7/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "BHTableView.h"
#import "GAITrackedViewController.h"
#import "BHLocationManager.h"
#import "BHCustomSearchBar.h"


@interface BHMainMapViewController : GAITrackedViewController <UITextFieldDelegate, MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate, BHLocationManagerDelegate>

@property (nonatomic, weak) IBOutlet MKMapView *mapView;
@property (nonatomic, weak) IBOutlet BHTableView *tableView;
@property (nonatomic, weak) IBOutlet BHCustomSearchBar *customSearchBar;

- (IBAction) handleViewListTouchUpInside:(id)sender;
- (IBAction) handleUpdateLocationTouchUpInside:(id)sender;

@end
