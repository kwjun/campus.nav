//
//  FavRooms.m
//  MapProject
//
//  Created by xcode on 2015-04-19.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import "FavRooms.h"

@implementation FavRooms
@synthesize room, latitude, longitude;

-(id)initWithData:(NSString *)r roomLat:(NSString *)lat roomLong:(NSString *)lon{
    if(self = [super init])
    {
        [self setRoom:r];
        [self setLatitude:lat];
        [self setLongitude:lon];

    }
    return self;
}

@end
