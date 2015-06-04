//
//  BHCustomSearchBar.h
//  DeliGuide
//
//  Created by AJ Green on 5/10/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BHLocationSearchTextField.h"

@protocol BHCustomSearchBarDelegate <NSObject>

- (void) customSearchbarTouchedUserLocation;
- (void) customSearchbarEnteredText:(NSString*)textEntered;
- (void) customSearchbarDidFinishedEditing:(NSString*)text;
- (void) customSearchbarTouchedRightButton:(id)sender;

@end

@interface BHCustomSearchBar : UIView <BHLocationSearchTextFieldDelegate>

@property (nonatomic, assign) BOOL shouldAutoShrink; // Lulz
@property (nonatomic, assign) IBOutlet id<BHCustomSearchBarDelegate> customSearchDelegate;
@property (nonatomic, weak) IBInspectable UIImage *searchImage;
@property (nonatomic, weak) IBInspectable UIImage *buttonImage;
@property (nonatomic, weak) IBInspectable NSString *rightSideButtonTitle;

@end
