//
//  BHLoadingViewController.h
//  DeliGuide
//
//  Created by AJ Green on 3/12/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface BHLoadingViewController : GAITrackedViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

- (IBAction)handleLocationTouchUpInside:(id)sender;

@end
