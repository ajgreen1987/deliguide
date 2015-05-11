//
//  BHUserObject.h
//  DeliGuide
//
//  Created by AJ Green on 5/9/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BHUserObject : NSObject

@property (nonatomic, assign) BOOL isAnonymous;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userEmail;
@property (nonatomic, strong) NSString *userPassword;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSMutableArray *favorites;

- (BOOL) isReadyForSignUp;

@end
