//
//  SheridanWebViewController.m
//  MapProject
//
//  Created by Gordon Cox
//
//

#import "SheridanWebViewController.h"

@interface SheridanWebViewController ()

@end

@implementation SheridanWebViewController

@synthesize sheridanPage, activity;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *urlAdddress = [NSURL URLWithString:@"https://www.sheridancollege.ca/about/campus-locations/trafalgar.aspx"];
    NSURLRequest *url = [NSURLRequest requestWithURL:urlAdddress];
    
    [sheridanPage loadRequest:url];
}

-(IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue {
    
}

- (void) webViewDidStartLoad: (UIWebView *)webView {
    [activity setHidden: NO];
    [activity startAnimating];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView {
    [activity setHidden:YES];
    [activity stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
