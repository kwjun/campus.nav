//
//  AppDelegate.h
//  MapProject
//
//  Created by Gordon Cox
//
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
    Classroom *roomToView;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *databaseName;
@property (strong, nonatomic) NSString *databasePath;
@property (strong, nonatomic) NSMutableArray *classrooms;

@property (strong, nonatomic) NSMutableArray *favRoom;

@property (strong, nonatomic) Classroom *roomToView;

-(void)insertIntoDatabase:(Classroom *) classroom;
-(void)checkAndCreateDatabase;
-(void)readFromDatabase;
-(void)insertIntoFavDatabase:(FavRooms *)fRoom;
-(void)readFavDataFromDatabase;
-(void)deleteFromDb:(FavRooms *)fRoom;


- (NSString *) validateNilString:(NSString *)strValue;

@end

