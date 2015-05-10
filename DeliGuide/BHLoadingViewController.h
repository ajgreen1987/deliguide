//
//  BHLoadingViewController.h
//  DeliGuide
//
//  Created by AJ Green on 3/12/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"
#import "BHLocationManager.h"

@class BHLocationSearchTextField;

@interface BHLoadingViewController : GAITrackedViewController <BHLocationManagerDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIButton *cancel;
@property (nonatomic, weak) IBOutlet BHLocationSearchTextField *searchTextField;

- (void) handleLocationTouchUpInside:(id)sender;
- (IBAction) handleFavoritesTouchUpInside:(id)sender;

- (IBAction)unwindToMenuViewController:(UIStoryboardSegue *)segue;
- (IBAction)handleCancelTouchUpInside:(id)sender;

@end
