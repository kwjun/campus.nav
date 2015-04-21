//
//  EventViewController.h
//  MapProject
//
//  Created by xcode on 2015-04-21.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    IBOutlet UITableView *tableViewObject;
    NSArray *mainArray;
    
    
}

@end
