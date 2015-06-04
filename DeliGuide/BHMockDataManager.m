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
    [mockUser setFavorites:[BHMockDataManager mockFavorites]];
    
    return mockUser;
}

+ (NSArray*) mockDelis
{
    NSMutableArray *toReturn = [[NSMutableArray alloc] initWithObjects:nil];
    
    // Seed (only once)
    srand48(arc4random());
    
    NSArray *mocks = @[@{@"Name":@"Columbus Gourmet",
                              @"Address":@"261 Columbus Ave, New York, NY 10023",
                              @"shortAddress":@"261 Columbus Ave",
                              @"Hours":@{@"Monday":@"7a - 8p",
                                         @"Tuesday":@"7a - 8p",
                                         @"Wednesday":@"7a - 8p",
                                         @"Thursday":@"7a - 8p",
                                         @"Friday":@"7a - 8p",
                                         @"Saturday":@"8a - 6p",
                                         @"Sunday":@"8a - 6p"},
                              @"Lat":[NSNumber numberWithDouble:40.777491],
                              @"Long":[NSNumber numberWithDouble:-73.978501],
                         @"Takeout":[NSNumber numberWithInt:1],
                         @"Delivery":[NSNumber numberWithInt:1],
                         @"Payments":@[@"Cash",@"credit card"],
                         @"URL":@"http://www.boarshead.com/",
                         @"Satisfaction":[NSNumber numberWithDouble:83]},
                            @{@"Name":@"Toasties",
                              @"Address":@"148 W 49th St, New York, NY 10019",
                              @"shortAddress":@"148 W 49th St",
                              @"Hours":@{@"Monday":@"7a - 6p",
                                         @"Tuesday":@"7a - 6p",
                                         @"Wednesday":@"7a - 6p",
                                         @"Thursday":@"7a - 6p",
                                         @"Friday":@"7a - 6p",
                                         @"Saturday":@"8a - 4p",
                                         @"Sunday":@"8a - 4p"},
                              @"Lat":[NSNumber numberWithDouble:40.760049],
                              @"Long":[NSNumber numberWithDouble:-73.983083],
                              @"Takeout":[NSNumber numberWithInt:1],
                              @"Delivery":[NSNumber numberWithInt:1],
                              @"Payments":@[@"Cash",@"credit card"],
                              @"URL":@"http://www.boarshead.com/",
                              @"Satisfaction":[NSNumber numberWithDouble:18]},
                            @{@"Name":@"Gourmet 157",
                              @"Address":@"157 Christopher St, New York, NY 10014",
                              @"shortAddress":@"157 Christopher St",
                              @"Hours":@{@"Monday":@"7a - 12p",
                                         @"Tuesday":@"7a - 12p",
                                         @"Wednesday":@"7a - 12p",
                                         @"Thursday":@"7a - 12p",
                                         @"Friday":@"7a - 12p",
                                         @"Saturday":@"7a - 12p",
                                         @"Sunday":@"7a - 12p"},
                              @"Lat":[NSNumber numberWithDouble:40.732926],
                              @"Long":[NSNumber numberWithDouble:-74.008220],
                              @"Takeout":[NSNumber numberWithInt:1],
                              @"Delivery":[NSNumber numberWithInt:1],
                              @"Payments":@[@"Cash",@"credit card"],
                              @"URL":@"http://www.boarshead.com/",
                              @"Satisfaction":[NSNumber numberWithDouble:76]},
                            @{@"Name":@"Sarah's Artisanal Kitchen",
                              @"Address":@"270 Madison Ave, New York, NY 10016",
                              @"shortAddress":@"270 Madison Ave",
                              @"Hours":@{@"Monday":@"6a - 7p",
                                         @"Tuesday":@"6a - 7p",
                                         @"Wednesday":@"6a - 7p",
                                         @"Thursday":@"6a - 7p",
                                         @"Friday":@"6a - 7p",
                                         @"Saturday":@"closed",
                                         @"Sunday":@"closed"},
                              @"Lat":[NSNumber numberWithDouble:40.751234],
                              @"Long":[NSNumber numberWithDouble:-73.980711],
                              @"Takeout":[NSNumber numberWithInt:1],
                              @"Delivery":[NSNumber numberWithInt:1],
                              @"Payments":@[@"Cash",@"credit card"],
                              @"URL":@"http://www.boarshead.com/",
                              @"Satisfaction":[NSNumber numberWithDouble:55]},
                            @{@"Name":@"Saluggi Pizza",
                              @"Address":@"325 Church St, New York, NY 10013",
                              @"shortAddress":@"325 Church St",
                              @"Hours":@{@"Monday":@"6a - 8p",
                                         @"Tuesday":@"6a - 8p",
                                         @"Wednesday":@"6a - 8p",
                                         @"Thursday":@"6a - 8p",
                                         @"Friday":@"6a - 8p",
                                         @"Saturday":@"6a - 8p",
                                         @"Sunday":@"closed"},
                              @"Lat":[NSNumber numberWithDouble:40.720102],
                              @"Long":[NSNumber numberWithDouble:-74.003582],
                              @"Takeout":[NSNumber numberWithInt:1],
                              @"Delivery":[NSNumber numberWithInt:1],
                              @"Payments":@[@"Cash",@"credit card"],
                              @"URL":@"http://www.boarshead.com/",
                              @"Satisfaction":[NSNumber numberWithDouble:91]}];
    
    
    for (NSDictionary *mock in mocks) {

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
         @property (nonatomic, strong) NSMutableArray *deliTravelTimes;
         @property (nonatomic, assign) BOOL isTakeoutAvailable;
         @property (nonatomic, assign) BOOL isDeliveryAvailable;
         @property (nonatomic, strong) NSMutableArray *paymentMethods;*/
        
        [newMockDeli setDeliName:[mock objectForKey:@"Name"]];
        [newMockDeli setDeliAddress:[mock objectForKey:@"Address"]];
        [newMockDeli setDeliDisplayAddress:[mock objectForKey:@"shortAddress"]];
        [newMockDeli setDeliMenu:nil]; // Need to mock out Menu Objects
        [newMockDeli setPhoneNumber:@"(123)-123-1234"];
        [newMockDeli setSatisfactionPercentage:[[mock objectForKey:@"Satisfaction"] doubleValue]];
        [newMockDeli setDeliHours:[mock objectForKey:@"Hours"]];

        [newMockDeli setIsFeatured:[[newMockDeli deliName] isEqualToString:@"Saluggi Pizza"]? YES : NO];
        
        [newMockDeli setLatitude:[[mock objectForKey:@"Lat"] doubleValue]];
        [newMockDeli setLongitude:[[mock objectForKey:@"Long"] doubleValue]];
        [newMockDeli setIsTakeoutAvailable:[[mock objectForKey:@"Takeout"] intValue]];
        [newMockDeli setIsTakeoutAvailable:[[mock objectForKey:@"Delivery"] intValue]];
        [newMockDeli setPaymentMethods:[mock objectForKey:@"Payments"]];
        [newMockDeli setWebsite:[NSURL URLWithString:[mock objectForKey:@"URL"]]];
        
        NSMutableArray *travelTimes = [[NSMutableArray alloc] initWithObjects:nil];
        
        for (int i=0; i<5; i++)
        {
            BHTravelObject *travel = [[BHTravelObject alloc] init];
            
            [travel setTravelMode:i];
            [travel setTravelTime:(i+1)*5.0f];

            [travelTimes addObject:travel];            
        }
        
        [newMockDeli setDeliTravelTimes:travelTimes];
        
        [toReturn addObject:newMockDeli];
    }

    
    NSArray *delis = [toReturn copy];
    return delis;
}

+ (NSArray*) mockFeaturedDelis
{
    NSArray *mockDelis = [BHMockDataManager mockDelis];
    NSMutableArray *featured = [[NSMutableArray alloc] initWithObjects:nil];
    
    for (BHDeliObject *deli in mockDelis)
    {
        if ([deli isFeatured])
        {
            [featured addObject:deli];
        }
    }
    
    return featured;
}

+ (NSArray*) mockFavorites
{
    NSMutableArray *delis = [[NSMutableArray alloc] initWithArray:[BHMockDataManager mockDelis]];
    
    [delis removeObjectAtIndex:0];
    [delis removeObjectAtIndex:delis.count-1];
    
    return delis;
}

@end
