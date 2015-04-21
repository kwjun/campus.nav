//
//  SettingsViewController.h
//  MapProject
//
//  Created by KwangJun Ko on 2015-04-21.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
{
    
    IBOutlet UIButton *btnLang;

    IBOutlet UIButton *lblSupport;
}
@property (strong, nonatomic) IBOutlet UIButton *btnLang;
@property (strong, nonatomic) IBOutlet UIButton *lblSupport;
-(IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue;
@end
