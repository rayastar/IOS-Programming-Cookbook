//
//  ViewController.m
//  1.24 UIWebView
//
//  Created by marat on 15/01/2015.
//  Copyright (c) 2015 marat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>
@property(nonatomic, strong) UIWebView *myWebView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.myWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:self.myWebView];
//    NSString *htmlString = @"<br/>iOS 7 Programming <strong>Cookbook</strong>";
//    [self.myWebView loadHTMLString:htmlString
//                           baseURL:nil];
	
//    self.myWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    self.myWebView.scalesPageToFit = YES;
//    [self.view addSubview:self.myWebView];
//    NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [self.myWebView loadRequest:request];
    
    self.myWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.myWebView.delegate = self;
    self.myWebView.scalesPageToFit = YES;
    [self.view addSubview:self.myWebView];
    NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.myWebView loadRequest:request];
}



- (void)webViewDidStartLoad:(UIWebView *)webView{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{ [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
