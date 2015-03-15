//
//  BHApplicationManager.m
//  DeliGuide
//
//  Created by AJ Green on 3/12/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHApplicationManager.h"
#import "BHDeliObject.h"

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

- (NSMutableArray*) delis
{
    if (_delis == nil)
    {
        _delis = [[NSMutableArray alloc] initWithObjects:nil];
    }
    
    return _delis;
}

- (void) setupMockDelis
{
    for (int i=0; i<25; i++)
    {
        BHDeliObject *newMockDeli = [[BHDeliObject alloc] init];
        
        /*
         @property (nonatomic, strong) NSString *deliName;
         @property (nonatomic, strong) NSString *deliAddress;
         @property (nonatomic, strong) NSString *deliDisplayAddress;
         @property (nonatomic, strong) NSMutableArray *deliMenu;
         @property (nonatomic, strong) NSString *phoneNumber;
         @property (nonatomic, assign) CGFloat satisfactionPercentage;
         @property (nonatomic, strong) NSString *deliHours;
         @property (nonatomic, assign) BOOL isFeatured;
         @property (nonatomic, strong) NSDecimalNumber *latitude;
         @property (nonatomic, strong) NSDecimalNumber *longitude;
         @property (nonatomic, strong) NSMutableDictionary *deliMoreInformation;
         @property (nonatomic, strong) NSMutableArray *deliTravelTimes;*/
        
        [newMockDeli setDeliName:@"Ma and Pa's World Famous Deli and Ice Cream"];
        [newMockDeli setDeliAddress:@"123 West 42nd Street, New York, New York 123456"];
        [newMockDeli setDeliDisplayAddress:@"123 West 42nd Street"];
        [newMockDeli setDeliMenu:nil]; // Need to mock out Menu Objects
        [newMockDeli setPhoneNumber:@"(123)-123-1234"];
        [newMockDeli setSatisfactionPercentage:94.2];
        [newMockDeli setDeliHours:@"Open 9 am - 5 pm"];
        [newMockDeli setIsFeatured:(i%2==0) ? YES : NO];
        [newMockDeli setLatitude:40.7127];
        [newMockDeli setLongitude:74.0059];
        [newMockDeli setDeliMoreInformation:nil]; // Need to mock out more info
        [newMockDeli setDeliTravelTimes:nil]; // Need to mock out travel times
        
        [self.delis addObject:newMockDeli];
    }
}

@end
