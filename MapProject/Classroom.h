//
//  Classroom.h
//  MapProject
//
//  Created by xcode on 2015-04-15.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Classroom : NSObject {
    NSString *roomNumber;
    NSString *name;
    double latitude;
    double longitude;
    NSString *roomDescription;
}

@property (nonatomic, strong) NSString *roomNumber;
@property (nonatomic, strong) NSString *name;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic, strong) NSString *roomDescription;

-(id)initWithData:(NSString *)rn theName:(NSString *)n theLatitude:(double)lat theLongitude:(double) lon theDescription:(NSString *)desc;

@end
