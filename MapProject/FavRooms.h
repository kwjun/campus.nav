//
//  FavRooms.h
//  MapProject
//
//  Created by xcode on 2015-04-19.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FavRooms : NSObject
{
    NSString *room;
    NSString *latitude;
    NSString *longitude;
}

@property(strong, nonatomic) NSString *room;
@property(strong, nonatomic) NSString *latitude;
@property(strong, nonatomic) NSString *longitude;

-(id)initWithData:(NSString *)r roomLat:(NSString *)lat roomLong:(NSString *)lon;

@end
