//
//  MapViewAnnotation.m
//  MapProject
//
//  Created by xcode on 2015-04-19.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import "MapViewAnnotation.h"

@implementation MapViewAnnotation

@synthesize coordinate, title;

-(id) initWithTitle:(NSString *) name AndCoordinate:(CLLocationCoordinate2D)coord
{
    self = [super init];
    title = name;
    coordinate = coord;
    return self;
}

@end