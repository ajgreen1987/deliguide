//
//  BHApplicationManager.h
//  DeliGuide
//
//  Created by AJ Green on 3/12/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BHUserObject.h"
#import "BHDeliObject.h"

@class KAWebViewController;

@interface BHApplicationManager : NSObject

@property (nonatomic, strong) BHUserObject *currentUser;
@property (nonatomic, assign) BOOL userSignedIn;
@property (nonatomic, strong) NSMutableArray *delis;
@property (nonatomic, strong) NSMutableArray *featuredDelis;
@property (nonatomic, assign) BOOL shouldSignUp;
@property (nonatomic, assign) BOOL shouldSignIn;
@property (nonatomic, assign) NSString *urlToLoad;

+ (instancetype)appManager;

- (UIAlertView *) getErrorMessageAlertViewWithTitle:(NSString *)title
                                            message:(NSString *)message
                                     viewController:(UIViewController *)viewController;

+ (void) callLocation:(NSString*)aTelephoneNumber;
+ (void) browserForURL:(NSURL *)aURL;
+ (NSString*) readStringFromUserDefaultsForKey:(NSString*)aKey;
+ (void) writeString:(NSString*)aValue toUserDefaultsForKey:(NSString*)aKey;
+ (NSString*) today;
+ (NSString*) isDeliOpenOrClosed:(BHDeliObject*)aDeli;

@end
