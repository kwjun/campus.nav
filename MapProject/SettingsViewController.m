//
//  SettingsViewController.m
//  MapProject
//
//  Created by KwangJun Ko on 2015-04-21.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import "SettingsViewController.h"


@implementation SettingsViewController
@synthesize btnLang;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [btnLang setTitle:NSLocalizedString(@"lang", nil) forState:UIControlStateNormal];
    
    
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] valueForKey:@"AppleLanguages"]);
    NSLog(@"te");
}

-(IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue {
    //Refresh language
    //[btnLang setTitle:NSLocalizedString(@"lang", nil) forState:UIControlStateNormal];
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"Localizable" ofType:@"strings" inDirectory:nil forLocalization:@"ko"];
    NSBundle *localizableBundle = [[NSBundle alloc] initWithPath:[bundlePath stringByDeletingLastPathComponent]];
    [btnLang setTitle:NSLocalizedStringFromTableInBundle(@"lang", nil, localizableBundle, nil) forState:UIControlStateNormal];
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
