//
//  SheridanWebViewController.h
//  MapProject
//
//  Created by Gordon Cox
//
//
#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface SheridanWebViewController : ViewController {
    IBOutlet UIWebView *sheridanPage;
    IBOutlet UIActivityIndicatorView *activity;
}

@property (nonatomic, strong) IBOutlet UIWebView *sheridanPage;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activity;

-(IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue;

@end
