//
//  BHDeliTableViewCell.h
//  DeliGuide
//
//  Created by AJ Green on 3/14/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BHDeliTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *satisfactionPercentage;
@property (nonatomic, weak) IBOutlet UILabel *deliName;
@property (nonatomic, weak) IBOutlet UILabel *openOrClosed;
@property (nonatomic, weak) IBOutlet UIImageView *travelMode;
@property (nonatomic, weak) IBOutlet UILabel *travelDistance;
@property (nonatomic, weak) IBOutlet UILabel *address;
@property (nonatomic, weak) IBOutlet UIImageView *deliImage;
@property (nonatomic, weak) IBOutlet UIImageView *featured;


@end
