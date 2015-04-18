//
//  AppDelegate.m
//  MapProject
//
//  Created by xcode on 2015-03-30.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize databaseName, databasePath, classrooms;

#pragma mark Database Implementation

-(void)checkAndCreateDatabase {
    BOOL success;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    success = [fileManager fileExistsAtPath:databasePath];
    
    if (success) return;
    
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: databaseName];
    
    [fileManager copyItemAtPath:databasePathFromApp toPath: databasePath error:nil];
}

-(void)insertIntoDatabase:(Classroom *)classroom {
    sqlite3 *database;
    
    Classroom *room = [[Classroom alloc] initWithData:@"E201" theName:@"Cool Room" theLatitude:@"129.12312" theLongitude:@"123.321213" theDescription:@"This is a room"];
    
    [self.classrooms addObject:room];
    
    if (sqlite3_open([self.databasePath UTF8String], &database) == SQLITE_OK) {
        
        const char *sqlStatement = "INSERT INTO Classrooms VALUES(?, ?, ?, ?, ?)";
        sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
            
            sqlite3_bind_text(compiledStatement, 1, [room.roomNumber UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 2, [room.name UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 3, [room.latitude UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 4, [room.longitude UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 5, [room.roomDescription UTF8String], -1, SQLITE_TRANSIENT);
            
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
        
        Boolean check = sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK;
        
        NSLog([NSString stringWithFormat:@"Check: %d", check]);
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
            
        NSLog(@"In if(sqlite3_prepare) ");
            
            // Loop through the results and add them to the feeds array
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                
            NSLog(@"In while_loop(checking for existing rows)");
                
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
                    latitude = [self validateNilString:[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)]];
                } @catch(NSException *ex) {
                    NSLog(@"In name, Exption: %@", ex);
                    latitude = @"nil";
                }
                
                NSLog(latitude);
                
                @try {
                    longitude = [self validateNilString:[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)]];
                } @catch(NSException *ex) {
                    NSLog(@"In name, Exption: %@", ex);
                    longitude = @"nil";
                }
                
                NSLog(longitude);
                
                @try {
                    roomDescription = [self validateNilString:[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)]];
                } @catch(NSException *ex) {
                    NSLog(@"In name, Exption: %@", ex);
                    roomDescription = @"nil";
                }
                
                NSLog(roomDescription);
                
                Classroom *classroom = [[Classroom alloc] initWithData:roomNumber theName:name theLatitude:latitude theLongitude:longitude theDescription:roomDescription];
                
                [self.classrooms addObject:classroom];
                
            }
            NSLog(@"After while loop");
        }
        NSLog(@"After sqlite3_prepareStatement if statement");
        // Release the compiled statement from memory
        sqlite3_finalize(compiledStatement);
        
    }
    NSLog(@"After sqlite3_open if statement");
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
    self.databaseName = @"Classrooms.sql";
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    self.databasePath = [documentsDir stringByAppendingPathComponent:self.databaseName];
  
    [self checkAndCreateDatabase];
    [self insertIntoDatabase: nil];
    //[self readFromDatabase];
    
    //Classroom *classroom = [[Classroom alloc] initWithData:@"E201" theName:@"Cool Room" theLatitude:@"129.12312" theLongitude:@"123.321213" theDescription:@"This is a room"];
    
    //[self.classrooms addObject:classroom];
    
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

@end
