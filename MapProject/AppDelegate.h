//
//  AppDelegate.h
//  MapProject
//
//  Created by xcode on 2015-03-30.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "Classroom.h"
#import "FavRooms.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    NSString *databaseName;
    NSString *databasePath;
    NSMutableArray *classrooms;
    
    //Peters array
    NSMutableArray *favRoom;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *databaseName;
@property (strong, nonatomic) NSString *databasePath;
@property (strong, nonatomic) NSMutableArray *classrooms;

@property (strong, nonatomic) NSMutableArray *favRoom;

-(void)insertIntoDatabase:(Classroom *) classroom;
-(void)checkAndCreateDatabase;
-(void)readFromDatabase;
-(void)insertIntoFavDatabase:(FavRooms *)fRoom;
-(void)readFavDataFromDatabase;



- (NSString *) validateNilString:(NSString *)strValue;

@end

