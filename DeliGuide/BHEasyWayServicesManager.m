//
//  BHEasyWayServicesManager.m
//  DeliGuide
//
//  Created by AJ Green on 4/25/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHEasyWayServicesManager.h"

static BHEasyWayServicesManager *sharedServicesManager;

@implementation BHEasyWayServicesManager

+ (instancetype)servicesManager
{
    @synchronized(self) {
        if (sharedServicesManager == nil)
        {
            sharedServicesManager = [[self alloc] init];
        }
    }
    return sharedServicesManager;
}

- (NSDictionary*) makeGetServiceRequestWithParameters:(NSDictionary*)serviceParameters
{
    NSString *urlString = @"";
    NSError *requestError = nil;
    NSError *responseError = nil;
    NSHTTPURLResponse *response = nil;
    
    NSURLRequest *request = [NSURLRequest
                             requestWithURL:[NSURL URLWithString:urlString]
                             cachePolicy:NSURLRequestReloadIgnoringCacheData
                             timeoutInterval:5.0];
    
    
    NSData *connectionData = [NSURLConnection sendSynchronousRequest:request
                                                   returningResponse:&response
                                                               error:&requestError];
    
    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:connectionData
                                                             options:NSJSONReadingMutableContainers
                                                               error:&responseError];
    
    return responseJSON;
    
}

@end
