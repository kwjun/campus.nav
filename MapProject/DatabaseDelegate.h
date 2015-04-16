//
//  DatabaseDelegate.h
//  MapProject
//
//  Created by xcode on 2015-04-15.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "Classroom.h"

@interface DatabaseDelegate : UIResponder <UIApplicationDelegate> {
    NSString *databaseName;
    NSString *databasePath;
    NSMutableArray *classrooms;
}

//@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *databaseName;
@property (strong, nonatomic) NSString *databasePath;
@property (strong, nonatomic) NSMutableArray *classrooms;

-(void)insertIntoDatabase:(Classroom *) classroom;
-(void)checkAndCreateDatabase;
-(void)readFromDatabase;

@end
