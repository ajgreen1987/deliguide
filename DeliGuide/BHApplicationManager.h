//
//  BHApplicationManager.h
//  DeliGuide
//
//  Created by AJ Green on 3/12/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BHApplicationManager : NSObject

@property (nonatomic, strong) NSMutableArray *delis;

+ (instancetype)appManager;

- (void) setupMockDelis;

- (UIAlertView *) getErrorMessageAlertViewWithTitle:(NSString *)title
                                            message:(NSString *)message
                                     viewController:(UIViewController *)viewController;

@end
