//
//  ViewController.m
//  WebViewTest
//
//  Created by iMac on 28.09.16.
//  Copyright © 2016 hata. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if ([self.urlString hasPrefix:@"http"]) {
        
        self.navigationItem.title = self.urlString;
        
        NSURL* url = [NSURL URLWithString:self.urlString];
        
        [self loadWebViewWithUrl:url];
        
    } else {
        
        self.navigationItem.title = self.urlString;
        
        NSString* filePath = [[NSBundle mainBundle] pathForResource:self.urlString ofType:@".pdf" inDirectory:@"pdf"];
        
        NSURL* url = [NSURL fileURLWithPath:filePath];
        
        [self loadWebViewWithUrl:url];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Support methods

- (void) loadWebViewWithUrl:(NSURL*) url {
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
    
}

#pragma mark - Actions

- (IBAction) actionBack:(id)sender {

    if ([self.webView canGoBack]) {
        [self.webView stopLoading];
        [self.webView goBack];
    }
}

- (IBAction) actionForward:(id)sender {
    
    if ([self.webView canGoForward]) {
        [self.webView stopLoading];
        [self.webView goForward];
    }
}

- (IBAction) actionRefresh:(id)sender {
    
    [self.webView stopLoading];
    [self.webView reload];
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    [self.indicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [self.indicator stopAnimating];
    
    self.backButtonItem.enabled = [self.webView canGoBack];
    self.forwarfButtonItem.enabled = [self.webView canGoForward];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
    
    [self.indicator stopAnimating];
}

@end
