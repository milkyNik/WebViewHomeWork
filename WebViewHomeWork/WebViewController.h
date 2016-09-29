//
//  ViewController.h
//  WebViewTest
//
//  Created by iMac on 28.09.16.
//  Copyright © 2016 hata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) NSString* urlString;
@property (strong, nonatomic) NSString* pdfString;

@property (weak, nonatomic) IBOutlet UIWebView* webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView* indicator; 

@property (weak, nonatomic) IBOutlet UIBarButtonItem* backButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem* forwarfButtonItem;

- (IBAction) actionBack:(id)sender;
- (IBAction) actionForward:(id)sender;
- (IBAction) actionRefresh:(id)sender;

@end

