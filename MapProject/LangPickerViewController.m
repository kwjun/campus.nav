//
//  LangPickerViewController.m
//  MapProject
//
//  Created by KwangJun Ko on 2015-04-21.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import "LangPickerViewController.h"
#import "AppDelegate.h"
@interface LangPickerViewController ()

@end

@implementation LangPickerViewController
@synthesize listLang, listLangId;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.listLangId = [[NSArray alloc] initWithObjects:@"en", @"ko", nil];
    self.listLang = [[NSArray alloc] initWithObjects:@"English", @"한국어", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Picker Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [listLangId count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [listLang objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    //Change current locale
    AppDelegate *mainDel = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [mainDel resetLocale:[listLangId objectAtIndex:row]];
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] valueForKey:@"AppleLanguages"]);
    NSLog(@"%@",[listLangId objectAtIndex:row]);
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
