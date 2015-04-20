//
//  AppDelegate.m
//  MapProject
//
//  Created by xcode on 2015-03-30.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import "AppDelegate.h"
#import "FavRooms.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize databaseName, databasePath, classrooms, favRoom;

#pragma mark Database Implementation

-(void)checkAndCreateDatabase {
    databaseName = @"Classrooms.sql";
    NSArray *documentsPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [documentsPaths objectAtIndex:0];
    databasePath = [documentsDir stringByAppendingPathComponent:databaseName];
    NSLog(@"Database path: %@", databasePath);
    BOOL success;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    success = [fileManager fileExistsAtPath:databasePath];
    
    if (success) return;
    
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: databaseName];
    
    [fileManager copyItemAtPath:databasePathFromApp toPath:databasePath error:nil];
    
    sqlite3 *database;
    sqlite3_stmt *statement;
    if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK)
    {
        NSString *create = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS favourites ('id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 'room' TEXT, 'latitude' TEXT, 'longitude' TEXT);"];
        const char *create_stmt = [create UTF8String];
        sqlite3_prepare_v2(database, create_stmt, -1, &statement, NULL);
        
        if(sqlite3_step(statement)==SQLITE_DONE)
        {
            NSLog(@"favourite table created");
        }
        else
        {
            NSLog(@"favourite table could not be created");
        }
        sqlite3_finalize(statement);
        sqlite3_close(database);
    }
    
}

-(void)insertIntoDatabase:(Classroom *)classroom {
    sqlite3 *database;
    
    if (sqlite3_open([self.databasePath UTF8String], &database) == SQLITE_OK) {
        
        const char *sqlStatement = "INSERT INTO Classrooms VALUES(?, ?, ?, ?, ?)";
        sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
            
            sqlite3_bind_text(compiledStatement, 1, [classroom.roomNumber UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 2, [classroom.name UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 3, [classroom.latitude UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 4, [classroom.longitude UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 5, [classroom.roomDescription UTF8String], -1, SQLITE_TRANSIENT);
        }
        if (sqlite3_step(compiledStatement) != SQLITE_DONE) {
            NSLog(@"Error: %s", sqlite3_errmsg(database));
        } else {
            NSLog(@"Insert into row id = %lld", sqlite3_last_insert_rowid(database));
        }
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
}


-(void)readFromDatabase {
    sqlite3 *database;
    
    [self.classrooms removeAllObjects];
    
    // Open the database from the users filessytem
    if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
        NSLog(@"IN if(sqlite3_open) ");
        
        // Setup the SQL Statement and compile it for faster access
        const char *sqlStatement = "SELECT * FROM Classrooms";
        
        sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
            
            // Loop through the results and add them to the feeds array
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                
                // Read the data from the result row
                NSString *roomNumber;
                NSString *name;
                NSString * latitude;
                NSString * longitude;
                NSString *roomDescription;
                
                @try {
                    roomNumber = [self validateNilString:[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)]];
                } @catch(NSException *ex) {
                    NSLog(@"In roomNumber, Exption: %@", ex);
                    roomNumber = @"nil";
                }
                
                NSLog(roomNumber);
                
                @try {
                    name = [self validateNilString:[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)]];
                } @catch(NSException *ex) {
                    NSLog(@"In name, Exption: %@", ex);
                    name = @"nil";
                }
                
                NSLog(name);
                
                @try {
                    latitude = [self validateNilString:[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)]];
                } @catch(NSException *ex) {
                    NSLog(@"In name, Exption: %@", ex);
                    latitude = @"nil";
                }
                
                NSLog(latitude);
                
                @try {
                    longitude = [self validateNilString:[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)]];
                } @catch(NSException *ex) {
                    NSLog(@"In name, Exption: %@", ex);
                    longitude = @"nil";
                }
                
                NSLog(longitude);
                
                @try {
                    roomDescription = [self validateNilString:[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 4)]];
                } @catch(NSException *ex) {
                    NSLog(@"In name, Exption: %@", ex);
                    roomDescription = @"nil";
                }
                
                NSLog(roomDescription);
                
                Classroom *classroom = [[Classroom alloc] initWithData:roomNumber theName:name theLatitude:latitude theLongitude:longitude theDescription:roomDescription];
                
                [self.classrooms addObject:classroom];
                
            }
            
        }
        
        // Release the compiled statement from memory
        sqlite3_finalize(compiledStatement);
        
    }
    
    sqlite3_close(database);
    
}

#pragma mark Formatting Methods

- (NSString *)validateNilString:(NSString *)strValue {
    
    NSString *returnString = @"";
    
    if (!strValue)
        return returnString;
    
    if ([strValue isKindOfClass:[NSNull class]])
        return returnString;
    
    if ([strValue isEqualToString:@"<nil>"])
        return returnString;
    
    if ([strValue isEqualToString:@"<null>"])
        return returnString;
    
    if ([strValue isEqualToString:@"NULL"])
        return returnString;
    
    if ([strValue isEqualToString:@"nil"])
        return returnString;
    
    if ([strValue isEqualToString:@"(null)"])
        return returnString;
    
    return strValue;
    
}

#pragma mark Application Methods


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    self.classrooms = [[NSMutableArray alloc] init];
    self.favRoom = [[NSMutableArray alloc] init];
    self.databaseName = @"Classrooms.sql";
    
    
    [self checkAndCreateDatabase];
    [self readFavDataFromDatabase];
    [self readFromDatabase];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark Peters DB methods

-(void)insertIntoFavDatabase:(FavRooms *)fRoom
{
    // Setup the database object
    sqlite3 *database;
    
    
    // Open the database from the users filessytem
    if(sqlite3_open([self.databasePath UTF8String], &database) == SQLITE_OK)
    {
        const char *sqlStatement = "INSERT INTO favourites VALUES(NULL, ?, ?, ?)";
        sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_text(compiledStatement, 1, [fRoom.room UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 2, [fRoom.latitude UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 3, [fRoom.longitude UTF8String], -1, SQLITE_TRANSIENT);
            NSLog(@"Insert done");
        }
        if(sqlite3_step(compiledStatement) == SQLITE_DONE)
        {
            NSLog(@"Insert into row id = %lld", sqlite3_last_insert_rowid(database));
            sqlite3_reset(compiledStatement);
            
        }
        else
        {
            NSLog(@"Error: %s", sqlite3_errmsg(database));
        }
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
}

-(void) readFavDataFromDatabase {
    
    // clear array
    [self.favRoom removeAllObjects];
    // Setup the database object
    sqlite3 *database;
    
    // Open the database from the users filessytem
    if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
        NSLog(@"In fav db open");
        const char *select = "SELECT * FROM favourites";
        sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, select, -1, &compiledStatement, NULL) == SQLITE_OK) {
            NSLog(@"In prepare v2");
            // Loop through the results and add them to array
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                // Read the data from the result row
                NSString *room = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
                NSString *lat = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
                NSString *lon = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];
                
                FavRooms *data = [[FavRooms alloc] initWithData:room roomLat:lat roomLong:lon];
                [self.favRoom addObject:data];
            }
        }
        else
        {
            //NSLog(@"Unable to read from database");
            NSLog(@"Error: %s", sqlite3_errmsg(database));
            
        }
        // Release the compiled statement from memory
        sqlite3_finalize(compiledStatement);
        
    }
    sqlite3_close(database);
}

-(void)deleteFromDb:(FavRooms *)fRoom
{
    sqlite3 *database;
    
    // Open the database from the users filessytem
    if(sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
        NSLog(@"In delete db");
        
        NSString *deleteSQL = [NSString stringWithFormat:@"DELETE FROM favourites WHERE room = ?"];
        
        const char *utf8Delete = [deleteSQL UTF8String];
        sqlite3_stmt *compiledStatement;
        sqlite3_prepare_v2(database, utf8Delete, -1, &compiledStatement, NULL);

        sqlite3_bind_text(compiledStatement, 1, [fRoom.room UTF8String], -1, SQLITE_TRANSIENT);

        
        if(sqlite3_step(compiledStatement) == SQLITE_DONE)
        {
            NSLog(@"Delete Successful");
        }
        else
        {
            NSLog(@"Error: %s", sqlite3_errmsg(database));
            
        }
        // Release the compiled statement from memory
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
}

@end
