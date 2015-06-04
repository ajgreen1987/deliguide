//
//  ViewController.h
//  DeliGuide
//
//  Created by AJ Green on 2/27/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"
#import "BHItalicLabel.h"
#import "BHDividerView.h"
#import "BHPrimaryButton.h"

@interface ViewController : GAITrackedViewController

- (IBAction)unwindToMenuViewController:(UIStoryboardSegue *)segue;

- (IBAction)handleSignInTouchUpInside:(id)sender;
- (IBAction)handleCreateAccountTouchUpInside:(id)sender;
- (IBAction)handleProductsAndNutritionTouchUpInside:(id)sender;
- (IBAction)handleBoarsHeadWebsiteTouchUpInside:(id)sender;

@property (weak, nonatomic) IBOutlet BHPrimaryButton *createAccount;
@property (weak, nonatomic) IBOutlet BHPrimaryButton *signIn;
@property (weak, nonatomic) IBOutlet BHItalicLabel *signInAs;
@property (weak, nonatomic) IBOutlet BHItalicLabel *username;
@property (weak, nonatomic) IBOutlet UIButton *signOut;
@property (weak, nonatomic) IBOutlet BHDividerView *signOutBottomDivider;
@property (weak, nonatomic) IBOutlet BHDividerView *signOutTopDivider;



@end

