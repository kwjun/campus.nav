//
//  FindClassroomViewController.h
//  MapProject
//
//  Created by Gordon Cox
//
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "AppDelegate.h"

@interface FindClassroomViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    AppDelegate *dbDelegate;
    IBOutlet UIBarButtonItem *goToMap;
    Classroom *roomToView;
}

@property (nonatomic, strong) AppDelegate *mainDelegate;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *goToMap;

-(IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue;

@end