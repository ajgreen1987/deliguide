//
//  BHWebViewController.h
//  DeliGuide
//
//  Created by AJ Green on 5/28/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BHWebViewController : UIViewController

@property (nonatomic, strong) NSURL *url;

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andURL:(NSURL*)url;

@property (nonatomic, weak) IBOutlet UIWebView *webview;
@property (nonatomic, weak) IBOutlet UIButton *back;
@property (nonatomic, weak) IBOutlet UIButton *forward;
@property (nonatomic, weak) IBOutlet UIButton *refresh;
@property (nonatomic, weak) IBOutlet UIButton *share;

- (IBAction) handleBack:(id)sender;
- (IBAction) handleForward:(id)sender;
- (IBAction) handleRefresh:(id)sender;
- (IBAction) handleShare:(id)sender;

@end
