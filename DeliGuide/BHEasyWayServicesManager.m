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

#pragma mark - Service Calls
/*
- (NSURL *) generateLocationURLWithZipCode:(NSString *)zipCode NumberToReturn:(NSNumber *)numberToReturn
{
    
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/locations/?address=%@&count=%d", LOCATIONS_URL, zipCode, [numberToReturn intValue]]];
}

- (NSURL *) generateLocationURLWithAddress:(NSString *)address NumberToReturn:(NSNumber *)numberToReturn
{
    address = [address stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
    // Short sync request
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/locations/?address=%@&count=%d", LOCATIONS_URL, [address stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], [numberToReturn intValue]]];
}

- (NSURL *) generateLocationURLWithLocation:(CLLocation*)location NumberToReturn:(NSNumber *)numberToReturn
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/locations/?address=%1.6f,%1.6f&count=%d", LOCATIONS_URL, location.coordinate.latitude, location.coordinate.longitude, [numberToReturn intValue]]];
}

- (void) makeRequestToURL:(NSURL*)anURL httpResponse:(NSHTTPURLResponse**)httpResponse error:(NSError **)error jsonDictionary:(NSDictionary**)jsonDictionary
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:anURL
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:5.0];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:httpResponse error:error];
    
    if (data && (([*httpResponse statusCode]/100) == 2))
    {
        *jsonDictionary = [NSJSONSerialization
                           JSONObjectWithData:data
                           options:kNilOptions
                           error:error];
    }
    
    
}
*/
+ (void) getDirectionsFromLocation:(CLLocation *)location
                        toLocation:(CLLocation*)aNewLocation
{
    NSString *mapsURLString = [NSString stringWithFormat:@"http://maps.apple.com/?saddr=%1.6f,%1.6f&daddr=%1.6f,%1.6f",
                               location.coordinate.latitude, location.coordinate.longitude, aNewLocation.coordinate.latitude, aNewLocation.coordinate.longitude];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mapsURLString]];
}

@end
