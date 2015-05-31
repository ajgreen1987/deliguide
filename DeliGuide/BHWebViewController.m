//
//  BHWebViewController.m
//  DeliGuide
//
//  Created by AJ Green on 5/28/15.
//  Copyright (c) 2015 Mode. All rights reserved.
//

#import "BHWebViewController.h"
#import "BHApplicationManager.h"

@interface BHWebViewController ()

@end

@implementation BHWebViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andURL:(NSURL*)url
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        self.url = url;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated
{
    [self.webview loadRequest:[NSURLRequest requestWithURL:self.url]];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [[BHApplicationManager appManager] setUrlToLoad:EMPTY_URL];
}

- (IBAction) handleBack:(id)sender
{
    if ([self.webview canGoBack])
    {
        [self.webview goBack];
    }
}

- (IBAction) handleForward:(id)sender
{
    if ([self.webview canGoForward])
    {
        [self.webview goForward];
    }
}

- (IBAction) handleRefresh:(id)sender
{
    [self.webview reload];
}

- (IBAction) handleShare:(id)sender
{
    UIActionSheet *shareSheet = [[UIActionSheet alloc] initWithTitle:@""
                                                            delegate:self
                                                   cancelButtonTitle:@"Cancel"
                                              destructiveButtonTitle:nil
                                                   otherButtonTitles:@"Open in Safari",nil];
    
    [shareSheet showInView:self.view];
}

#pragma mark - Action Sheet Delegate
- (void) actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
            [BHApplicationManager browserForURL:self.url];
            break;
        default:
            break;
    }
}

@end
