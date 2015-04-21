//
//  LangPickerViewController.h
//  MapProject
//
//  Created by KwangJun Ko on 2015-04-21.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LangPickerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
    IBOutlet UIPickerView *langPicker;
    NSArray *listLang;
    NSArray *listLangId;
}
@property (strong, nonatomic) IBOutlet UIPickerView *langPicker;
@property (nonatomic, strong) NSArray *listLang;
@property (nonatomic, strong) NSArray *listLangId;
@end
