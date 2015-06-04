//
//  ViewController.m
//  DeliGuide
//
//  Created by AJ Green on 2/27/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "ViewController.h"
#import "BHApplicationManager.h"
#import "BHWebViewController.h"

@interface ViewController ()

- (void) hideForAuthenticationStatus;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setScreenName:@"LANDING"];
    
    [self hideForAuthenticationStatus];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) hideForAuthenticationStatus
{
    BOOL isUserSignedIn = [[BHApplicationManager appManager] userSignedIn];
    
    [self.signIn setHidden:isUserSignedIn];
    [self.createAccount setHidden:isUserSignedIn];
    [self.signInAs setHidden:!isUserSignedIn];
    [self.username setHidden:!isUserSignedIn];
    [self.signOut setHidden:!isUserSignedIn];
    [self.signOutBottomDivider setHidden:!isUserSignedIn];
    [self.signOutTopDivider setHidden:!isUserSignedIn];
    
}

- (IBAction)unwindToMenuViewController:(UIStoryboardSegue *)segue { }

- (IBAction)handleSignInTouchUpInside:(id)sender
{
    [[BHApplicationManager appManager] setShouldSignIn:YES];
}

- (IBAction)handleCreateAccountTouchUpInside:(id)sender
{
    [[BHApplicationManager appManager] setShouldSignUp:YES];
}

- (IBAction)handleProductsAndNutritionTouchUpInside:(id)sender
{
    [[BHApplicationManager appManager] setUrlToLoad:@"http://boarshead.com/products"];
}

- (IBAction)handleBoarsHeadWebsiteTouchUpInside:(id)sender
{
    [[BHApplicationManager appManager] setUrlToLoad:@"http://boarshead.com"];
}

- (IBAction) handleContactTouchUpInside:(id)sender
{
    [[BHApplicationManager appManager] setUrlToLoad:@"http://boarshead.com/about/contact"];
}



@end
