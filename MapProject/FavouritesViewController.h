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
}

@property(strong,nonatomic) AppDelegate *mainDelegate;
@property(strong,nonatomic) NSIndexPath *selectedIndex;
@end
