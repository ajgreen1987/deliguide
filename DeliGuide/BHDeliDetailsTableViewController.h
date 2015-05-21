//
//  BHDeliDetailsTableViewController.h
//  DeliGuide
//
//  Created by AJ Green on 3/15/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface BHDeliDetailsTableViewController : UITableViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *like;
@property (weak, nonatomic) IBOutlet UIButton *dislike;
@property (weak, nonatomic) IBOutlet MKMapView *mapview;
@property (weak, nonatomic) IBOutlet UILabel *percentage;

- (IBAction)handleCallLocationTouchUpInside:(id)sender;
- (IBAction)handleDirectionsTouchUpInside:(id)sender;
- (IBAction)handleOrderTouchUpInside:(id)sender;
- (IBAction)handleTravelTimeTouchUpInside:(id)sender;
- (IBAction)handleHoursTouchUpInside:(id)sender;
- (IBAction)handleViewMenuTouchUpInside:(id)sender;

- (IBAction)handleLikeTouchUpInside:(id)sender;
- (IBAction)handleDislikeTouchUpInside:(id)sender;

- (IBAction)handleAddToFavoritesTouchUpInside:(id)sender;
- (IBAction)handleDeliWebsiteTouchUpInside:(id)sender;
- (IBAction)handleFacebookTouchUpInside:(id)sender;

@end
