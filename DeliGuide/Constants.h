//
//  Constants.h
//  DeliGuide
//
//  Created by AJ Green on 3/7/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#ifndef DeliGuide_Constants_h
#define DeliGuide_Constants_h

#define USE_MOCK_LOCATIONS  1

#define API_KEY                     @"skxgq9aqrs"
#define API_BASE_URL                @"http://www.easywayordering.com/ewoapi/ewoapi_v1.php?apireq"
#define API_KVP_EQUALS              @"="
#define API_PARAMETER_SEPERATOR     @"?"

#define USER_ID_KEY     @"USERID"

#define CANCEL_LOC_SEARCH       @"CANCELSEARCH"
#define SLIDING_MENU_STORYBOARD_ID @"SlidingMenu"
#define LOADING_CONTROLLER_STORYBOARD_ID @"LoadingController"
#define FADE_SEGUE_ID   @"LandingFade"

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
#define SYSTEM_VERSION_IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define isPhone568 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 568)
#define iPhone568ImageNamed(image) (isPhone568 ? [NSString stringWithFormat:@"%@-568h.%@", [image stringByDeletingPathExtension], [image pathExtension]] : image)
#define iPhone568Image(image) ([UIImage imageNamed:iPhone568ImageNamed(image)])

#define NAVIGATION_BAR_BACK [UIImage imageNamed:@"arrow-back"]
#define NAVIGATION_FONT     [UIFont fontWithName:@"Arial-Bold" size:0.0f]

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

#define RED_1   UIColorFromRGB(0x9C2B21)
#define GOLD_1  UIColorFromRGB(0xB5985A)
#define GOLD_2  UIColorFromRGB(0xDFB968)
#define CREAM_1 UIColorFromRGB(0xFFFCF4)
#define GRAY_1  UIColorFromRGB(0xC3BCAE)
#define GRAY_2  UIColorFromRGB(0x787878)

#define UIViewParentController(__view) ({ \
UIResponder *__responder = __view; \
while ([__responder isKindOfClass:[UIView class]]) \
__responder = [__responder nextResponder]; \
(UIViewController *)__responder; \
})

#endif
