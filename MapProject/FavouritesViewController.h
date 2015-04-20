//
//  FavouritesViewController.h
//  MapProject
//
// Created by Peter
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface FavouritesViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
{
    AppDelegate *mainDelegate;
    NSIndexPath *selectedIndex;
    UITableView *tableView;
}

@property(strong,nonatomic) AppDelegate *mainDelegate;
@property(strong,nonatomic) NSIndexPath *selectedIndex;
@property(strong,nonatomic) UITableView *tableView;
@end
