//
//  WebViewController.m
//  CodeChallenge1
//
//  Created by Adam Cooper on 10/2/14.
//  Copyright (c) 2014 Adam Cooper. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityMonitor;



@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://www.mobilemakers.co"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
    self.title = self.webViewTitle;
    NSLog(@"%@",self.webViewTitle);
}


- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.activityMonitor startAnimating];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityMonitor stopAnimating];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
}

@end
