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
            
            sharedAppManager.urlToLoad = EMPTY_URL;
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

- (NSMutableArray*) delis
{
    if (USE_MOCK_LOCATIONS)
    {
        _delis = [[NSMutableArray alloc] initWithArray:[BHMockDataManager mockDelis]];
    }
    else if (_delis == nil)
    {
        _delis = [[NSMutableArray alloc] initWithObjects:nil];
    }
    
    return _delis;
}

- (NSMutableArray*) featuredDelis
{
    if (USE_MOCK_LOCATIONS)
    {
        _featuredDelis = [[NSMutableArray alloc] initWithArray:[BHMockDataManager mockFeaturedDelis]];
    }
    else if(_featuredDelis == nil)
    {
        _featuredDelis = [[NSMutableArray alloc] initWithObjects:nil];
    }
    
    return _featuredDelis;
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

+ (void) browserForURL:(NSURL *)aURL
{
    [[UIApplication sharedApplication] openURL:aURL];
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

+ (NSString*) today
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    
    return [dateFormatter stringFromDate:[NSDate date]];
}

+ (NSString*) isDeliOpenOrClosed:(BHDeliObject*)aDeli
{
    NSString *today = [BHApplicationManager today];
    
    NSString *hours = [[aDeli deliHours] objectForKey:today];
    
    return ([hours isEqualToString:@"closed"])? @"Closed" : @"Open";
}

@end
