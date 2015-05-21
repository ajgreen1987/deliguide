//
//  BHMockDataManager.m
//  DeliGuide
//
//  Created by AJ Green on 5/10/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHMockDataManager.h"
#import "BHUserObject.h"
#import "BHDeliObject.h"

@implementation BHMockDataManager

+ (BHUserObject*) anonymousUser
{
    BHUserObject *anon = [[BHUserObject alloc] init];
    
    [anon setIsAnonymous:YES];
    
    return anon;
}

+ (BHUserObject*) mockUser
{
    BHUserObject *mockUser = [[BHUserObject alloc] init];
    
    [mockUser setUserName:@"First Last"];
    [mockUser setUserEmail:@"First.Last@Email.com"];
    [mockUser setUserID:@"1233456789"];
    
    return mockUser;
}

+ (NSArray*) mockDelis
{
    NSMutableArray *toReturn = [[NSMutableArray alloc] initWithObjects:nil];
    
    // Seed (only once)
    srand48(arc4random());
    
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
        
        double baseLat = 35.225633;
        double baseLong = -80.848663;
        double randomMinus = drand48()/10;
        double randomMinusLong = drand48()/10;
        
        [newMockDeli setLatitude:baseLat - randomMinus];
        [newMockDeli setLongitude:baseLong - randomMinusLong];
        [newMockDeli setDeliMoreInformation:nil]; // Need to mock out more info
        [newMockDeli setDeliTravelTimes:nil]; // Need to mock out travel times
        
        [toReturn addObject:newMockDeli];
    }

    
    NSArray *delis = [toReturn copy];
    return delis;
}

@end
