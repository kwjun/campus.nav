//
//  FindClassroomViewController.h
//  MapProject
//
//  Created by Gordon Cox
//
//
//   The classrooms displayed here will be recieved
//   from a database that has been pre-populated, and these
//   pages should usually only be displayed to adminisrators who
//   can modify the information (such as room location, name, and description)
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