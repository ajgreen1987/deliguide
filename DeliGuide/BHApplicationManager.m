//
//  BHApplicationManager.m
//  DeliGuide
//
//  Created by AJ Green on 3/12/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHApplicationManager.h"
#import "BHDeliObject.h"
#import "BHMockDataManager.h"


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

- (NSArray*) delis
{
    if (USE_MOCK_LOCATIONS)
    {
        _delis = [BHMockDataManager mockDelis];
    }
    else if (_delis == nil)
    {
        _delis = [[NSMutableArray alloc] initWithObjects:nil];
    }
    
    return _delis;
}

+ (void) callLocation:(NSString*)aTelephoneNumber
{
    NSString *telephone = [NSString stringWithFormat:@"tel:%@",aTelephoneNumber];
    
    NSURL *url = [NSURL URLWithString:telephone];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        [[UIApplication sharedApplication] openURL:url];
    }
    else
    {
        UIAlertView *alert = [[BHApplicationManager appManager] getErrorMessageAlertViewWithTitle:@"Calling is disabled"
                                                                     message:@"Please call the location from a mobile device"
                                                              viewController:nil];
        
        [alert show];
    }
}

+ (void) browserForURL:(NSString *)aURL
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:aURL]];
}

+ (NSString*) readStringFromUserDefaultsForKey:(NSString*)aKey
{
    return (NSString*)[[NSUserDefaults standardUserDefaults] stringForKey:aKey];
}

+ (void) writeString:(NSString*)aValue toUserDefaultsForKey:(NSString*)aKey
{
    [[NSUserDefaults standardUserDefaults] setValue:aValue
                                             forKey:aKey];
}

@end
