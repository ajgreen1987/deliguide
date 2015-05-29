//
//  UIFont+SmallFont.m
//  DeliGuide
//
//  Created by AJ Green on 5/24/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "UIFont+SmallFont.h"
#import <CoreText/CoreText.h>

@implementation UIFont (SmallFont)

+ (UIFont *) applicationSmallCapsFont:(NSString*)fontName withSize:(CGFloat) size
{
     // Use this to log all of the properties for a particular font
     UIFont *font = [UIFont fontWithName: fontName size: size];
     CFArrayRef  fontProperties  =  CTFontCopyFeatures ( ( __bridge CTFontRef ) font ) ;
     NSLog(@"properties = %@", fontProperties);

    
    NSArray *fontFeatureSettings = @[ @{ UIFontFeatureTypeIdentifierKey: @(37),
                                         UIFontFeatureSelectorIdentifierKey : @(1) } ];
    
    NSDictionary *fontAttributes = @{ UIFontDescriptorFeatureSettingsAttribute: fontFeatureSettings ,
                                      UIFontDescriptorNameAttribute: fontName } ;
    
    UIFontDescriptor *fontDescriptor = [ [UIFontDescriptor alloc] initWithFontAttributes: fontAttributes ];
    
    return [UIFont fontWithDescriptor:fontDescriptor size:size];
}


@end
