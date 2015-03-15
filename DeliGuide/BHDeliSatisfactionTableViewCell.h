//
//  BHDeliSatisfactionTableViewCell.h
//  DeliGuide
//
//  Created by AJ Green on 3/15/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BHDeliSatisfactionTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIButton *like;
@property (nonatomic, weak) IBOutlet UIButton *dislike;
@property (nonatomic, weak) IBOutlet UILabel *satisfactionPercentage;

@end
