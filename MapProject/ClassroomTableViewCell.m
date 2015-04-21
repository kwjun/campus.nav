//
//  ClassroomTableViewCell.m
//  MapProject
//
//  Created by Gordon Cox
//
//
//

#import "ClassroomTableViewCell.h"

@implementation ClassroomTableViewCell

@synthesize roomNumberLabel, classrooomNameLabel, latitudeLabel, longitudeLabel, roomDescriptionLabel;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        roomNumberLabel = [[UILabel alloc]init];
        roomNumberLabel.textAlignment = NSTextAlignmentCenter;
        roomNumberLabel.font = [UIFont systemFontOfSize:16];
        roomNumberLabel.textColor =[UIColor blackColor];
        roomNumberLabel.backgroundColor = [UIColor clearColor];

        classrooomNameLabel = [[UILabel alloc]init];
        classrooomNameLabel.textAlignment = NSTextAlignmentLeft;
        classrooomNameLabel.font = [UIFont systemFontOfSize:16];
        classrooomNameLabel.textColor =[UIColor blackColor];
        classrooomNameLabel.backgroundColor = [UIColor clearColor];

        latitudeLabel = [[UILabel alloc]init];
        latitudeLabel.textAlignment = NSTextAlignmentLeft;
        latitudeLabel.font = [UIFont systemFontOfSize:12];
        latitudeLabel.textColor =[UIColor blackColor];
        latitudeLabel.backgroundColor = [UIColor clearColor];
        
        longitudeLabel = [[UILabel alloc]init];
        longitudeLabel.textAlignment = NSTextAlignmentLeft;
        longitudeLabel.font = [UIFont systemFontOfSize:12];
        longitudeLabel.textColor =[UIColor blackColor];
        longitudeLabel.backgroundColor = [UIColor clearColor];
        
        roomDescriptionLabel = [[UILabel alloc]init];
        roomDescriptionLabel.textAlignment = NSTextAlignmentLeft;
        roomDescriptionLabel.font = [UIFont systemFontOfSize:12];
        roomDescriptionLabel.textColor =[UIColor blackColor];
        roomDescriptionLabel.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:roomNumberLabel];
        [self.contentView addSubview:classrooomNameLabel];
        [self.contentView addSubview:latitudeLabel];
        [self.contentView addSubview:longitudeLabel];
        [self.contentView addSubview:roomDescriptionLabel];
        
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    //50 height, 320 weight
    
    CGRect frame;
    
    //Classroom Room Number Label
    frame = CGRectMake(10, 15, 50, 20);
    roomNumberLabel.frame = frame;
    
    //Classroom Name Label
    frame = CGRectMake(70, 15, 100, 20);
    classrooomNameLabel.frame = frame;
    
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
