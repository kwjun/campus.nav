//
//  SheridanWebViewController.h
//  MapProject
//
//  Created by xcode on 2015-04-15.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
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
