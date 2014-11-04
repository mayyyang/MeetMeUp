//
//  WebViewController.m
//  MeetMeUp
//
//  Created by May Yang on 11/3/14.
//  Copyright (c) 2014 May Yang. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView loadRequest:self.urlRequest];
    self.activityIndicator.hidesWhenStopped = YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.activityIndicator startAnimating];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityIndicator stopAnimating];
    NSString *webTitle = ([self.webView stringByEvaluatingJavaScriptFromString:@"document.title"]);
    self.navigationItem.title = webTitle;
}

- (IBAction)backButton:(UIButton *)sender
{
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }

}


- (IBAction)forwardButton:(UIButton *)sender
{
    if (self.webView.canGoForward) {
        [self.webView goForward];
    }
}


@end
