//
//  Classroom.m
//  MapProject
//
//  Created by xcode on 2015-04-15.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import "Classroom.h"

@implementation Classroom

@synthesize roomNumber, name, latitude, longitude, roomDescription;

-(id)initWithData:(NSString *)rn theName:(NSString *)n theLatitude:(NSString *)lat theLongitude:(NSString *)lon theDescription:(NSString *)desc {
    
    if (self = [super init]) {
        [self setRoomNumber: rn];
        [self setName: n];
        [self setLatitude:lat];
        [self setLongitude:lon];
        [self setRoomDescription:desc];
    }
    
    return self;
    
}

@end
