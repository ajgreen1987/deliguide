//
//  BHDeliDetailTableViewCell.h
//  DeliGuide
//
//  Created by AJ Green on 3/15/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BHDeliDetailTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *deliName;
@property (nonatomic, weak) IBOutlet UILabel *deliAddress;
@property (nonatomic, weak) IBOutlet UILabel *deliHourAndDistance;
@property (nonatomic, weak) IBOutlet UIButton *modeOfTransportation;
@property (nonatomic, weak) IBOutlet UIButton *phoneNumber;
@property (nonatomic, weak) IBOutlet UIButton *getDirections;

@end
