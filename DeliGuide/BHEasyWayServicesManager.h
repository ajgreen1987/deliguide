//
//  BHEasyWayServicesManager.h
//  DeliGuide
//
//  Created by AJ Green on 4/25/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <Foundation/Foundation.h>

#define API_KEY                     @"skxgq9aqrs"
#define API_BASE_URL                @"http://www.easywayordering.com/ewoapi/ewoapi_v1.php?apireq"
#define API_KVP_EQUALS              @"="
#define API_PARAMETER_SEPERATOR     @"?"

@interface BHEasyWayServicesManager : NSObject

+ (instancetype) servicesManager;

- (NSDictionary*) makeGetServiceRequestWithParameters:(NSDictionary*)serviceParameters;

@end
