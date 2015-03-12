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


@interface BHMainMapViewController : UIViewController <UITextFieldDelegate, MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet MKMapView *mapView;
@property (nonatomic, weak) IBOutlet UIButton *filter;
@property (nonatomic, weak) IBOutlet UITextField *zipSearch;
@property (nonatomic, weak) IBOutlet BHTableView *tableView;

- (IBAction) handleFilterTouchUpInside:(id)sender;
- (IBAction) handleViewListTouchUpInside:(id)sender;
- (IBAction) handleUpdateLocationTouchUpInside:(id)sender;

@end