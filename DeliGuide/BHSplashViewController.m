//
//  BHSplashViewController.m
//  DeliGuide
//
//  Created by AJ Green on 5/6/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHSplashViewController.h"

@interface BHSplashViewController ()

@end

@implementation BHSplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self performSelector:@selector(moveToLanding)
               withObject:nil
               afterDelay:3.0f];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) moveToLanding
{
    [self performSegueWithIdentifier:FADE_SEGUE_ID
                              sender:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
