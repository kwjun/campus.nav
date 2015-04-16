//
//  Classroom.h
//  MapProject
//
//  Created by Gordon Cox

#import <Foundation/Foundation.h>

@interface Classroom : NSObject {
    NSString *roomNumber;
    NSString *name;
    NSString *latitude;
    NSString *longitude;
    NSString *roomDescription;
}

@property (nonatomic, strong) NSString *roomNumber;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, strong) NSString *roomDescription;

-(id)initWithData:(NSString *)rn theName:(NSString *)n theLatitude:(NSString *)lat theLongitude:(NSString *) lon theDescription:(NSString *)desc;

@end
