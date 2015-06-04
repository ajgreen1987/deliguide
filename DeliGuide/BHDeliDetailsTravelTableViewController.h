//
//  BHDeliDetailsTravelTableViewController.h
//  DeliGuide
//
//  Created by AJ Green on 5/21/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TravelDelegate <NSObject>

- (void) selectedTravelTime:(NSString*)travel;

@end

@interface BHDeliDetailsTravelTableViewController : UITableViewController

@property (nonatomic, assign) id<TravelDelegate> travelDelegate;
@property (nonatomic, strong) NSArray *travel;

@end
