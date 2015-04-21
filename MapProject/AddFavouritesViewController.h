//
//  AddFavouritesViewController.h
//  MapProject
//
//  Created by xcode on 2015-04-15.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "MapViewController.h"

@interface AddFavouritesViewController : ViewController
{
    AppDelegate *mainDelegate;
    MapViewController *mvc;
    IBOutlet UITextField *tfRoom;
    IBOutlet UITextField *tfLat;
    IBOutlet UITextField *tfLon;
    
}

@property(strong, nonatomic) AppDelegate *mainDelegate;
@property(strong, nonatomic) MapViewController *mvc;
@property(strong, nonatomic) IBOutlet UITextField *tfRoom;
@property(strong, nonatomic) IBOutlet UITextField *tfLat;
@property(strong, nonatomic) IBOutlet UITextField *tfLon;
@end
