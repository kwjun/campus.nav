//
//  Classroom.h
//  MapProject
//
//  Created by Gordon Cox

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
