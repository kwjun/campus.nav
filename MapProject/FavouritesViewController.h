//
//  FavouritesViewController.h
//  MapProject
//
// Created by Peter
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface FavouritesViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    AppDelegate *mainDelegate;
}

@property(strong,nonatomic) AppDelegate *mainDelegate;
@end
