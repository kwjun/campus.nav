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
#import "DatabaseDelegate.h"

@interface FindClassroomViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    DatabaseDelegate *dbDelegate;
}

@property (nonatomic, strong) DatabaseDelegate *dbDelegate;

@end