//
//  BHHoursTableViewController.h
//  DeliGuide
//
//  Created by AJ Green on 5/21/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BHHoursTableViewController : UITableViewController

@property (nonatomic, strong) NSDictionary *hours;

@property (weak, nonatomic) IBOutlet UILabel *sundayHours;
@property (weak, nonatomic) IBOutlet UILabel *mondayHours;
@property (weak, nonatomic) IBOutlet UILabel *tuesdayHours;
@property (weak, nonatomic) IBOutlet UILabel *wednesdayHours;
@property (weak, nonatomic) IBOutlet UILabel *thursdayHours;
@property (weak, nonatomic) IBOutlet UILabel *fridayHours;
@property (weak, nonatomic) IBOutlet UILabel *saturdayHours;


@end
