//
//  ViewController.h
//  MapProject
//
//  Created by Alex

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UIButton *findClassroomButton;
}

@property (nonatomic, strong) IBOutlet UIButton *findClassroomButton;

-(IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue;

@end