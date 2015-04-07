//
//  ViewController.m
//  DeliGuide
//
//  Created by AJ Green on 2/27/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "ViewController.h"
#import "BHApplicationManager.h"

@interface ViewController ()

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [BHApplicationManager browserForURL:@"http://boarshead.com/health-wellness"];
}

- (IBAction)handleBoarsHeadWebsiteTouchUpInside:(id)sender
{
    [BHApplicationManager browserForURL:@"http://www.boarshead.com"];
}

@end
