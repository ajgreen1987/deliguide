//
//  BHApplicationManager.m
//  DeliGuide
//
//  Created by AJ Green on 3/12/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHApplicationManager.h"

static BHApplicationManager *sharedAppManager;

@implementation BHApplicationManager

+ (instancetype)appManager
{
    @synchronized(self) {
        if (sharedAppManager == nil)
        {
            sharedAppManager = [[self alloc] init];
        }
    }
    return sharedAppManager;
}

- (UIAlertView *) getErrorMessageAlertViewWithTitle:(NSString *)title
                                            message:(NSString *)message
                                     viewController:(UIViewController *)viewController
{
    UIAlertView *alertView;
    
        alertView = [[UIAlertView alloc] initWithTitle:title
                                               message:message
                                              delegate:viewController
                                     cancelButtonTitle:@"OK"
                                     otherButtonTitles:nil, nil];
    
    return alertView;
}

@end
