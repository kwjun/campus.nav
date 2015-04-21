//
//  SupportWebViewController.h
//  MapProject
//
//  Created by KwangJun Ko on 2015-04-21.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SupportWebViewController : UIViewController
{
    IBOutlet UIWebView *webView;
    IBOutlet UIActivityIndicatorView *activity;
}
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
