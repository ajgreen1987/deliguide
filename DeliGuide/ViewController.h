//
//  ViewController.h
//  DeliGuide
//
//  Created by AJ Green on 2/27/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"

@interface ViewController : GAITrackedViewController

- (IBAction)unwindToMenuViewController:(UIStoryboardSegue *)segue;

@end

