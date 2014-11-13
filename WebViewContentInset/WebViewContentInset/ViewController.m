//
//  ViewController.m
//  WebViewContentInset
//
//  Created by Chris Morris on 11/12/14.
//  Copyright (c) 2014 HitsvilleDevelopment. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // These two lines when run on any device but the iPhone 5, work as expected
    // On the iPhone 5, there is a black bar at the bottom of the screen
    // If these lines are commented out, and automaticallyAdjustsScrollViewInsets
    // is set to YES, things work as expected on all devices.
    //
    // Question 1. Why don't these lines work on iPhone 5?
    // Work Around 1. If I make it a WKWebView instead of a UIWebView, it works
    //                as expected.
    // Question 2. How is the automaticallyAdjustsScrollViewInsets implemented?
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.webView.scrollView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);

    // Not necessary, but useful in practice
    // self.webView.scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(64, 0, 0, 0);

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.csuchico.edu"]]];
}

@end
