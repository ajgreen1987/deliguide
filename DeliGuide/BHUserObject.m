//
//  BHUserObject.m
//  DeliGuide
//
//  Created by AJ Green on 5/9/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHUserObject.h"

@interface BHUserObject ()

- (BOOL) isValid:(NSString*)aString;

@end

@implementation BHUserObject

- (id) init
{
    self = [super init];
    
    if (self)
    {
        self.favorites = [[NSMutableArray alloc] initWithObjects:nil];
    }
    
    return self;
}

- (BOOL) isReadyForSignUp
{
    return ([self isValid:self.userEmail]
            && [self isValid:self.userName]
            && [self isValid:self.userPassword]);
}

- (BOOL) isValid:(NSString*)aString
{
    return (([aString length]>0) && ![aString isEqualToString:@""]);
}

@end
