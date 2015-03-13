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

@interface BHLoadingViewController : GAITrackedViewController <BHLocationManagerDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

- (IBAction)handleLocationTouchUpInside:(id)sender;

@end
