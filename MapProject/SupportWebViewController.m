//
//  SupportWebViewController.m
//  MapProject
//
//  Created by KwangJun Ko on 2015-04-21.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import "SupportWebViewController.h"

@interface SupportWebViewController ()

@end

@implementation SupportWebViewController
@synthesize webView, activity;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *urlAddress = [NSURL URLWithString:NSLocalizedString(@"supportUrl", nil)];
    NSURLRequest *url = [NSURLRequest requestWithURL:urlAddress];
    [webView loadRequest:url];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [activity setHidden:NO];
    [activity startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activity setHidden:YES];
    [activity stopAnimating];
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
