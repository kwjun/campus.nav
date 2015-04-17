//
//  ClassroomTableViewCell.m
//  MapProject
//
//  Created by xcode on 2015-04-15.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import "ClassroomTableViewCell.h"

@implementation ClassroomTableViewCell

@synthesize classrooomNameLabel;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        classrooomNameLabel = [[UILabel alloc]init];
        classrooomNameLabel.textAlignment = NSTextAlignmentLeft;
        classrooomNameLabel.font = [UIFont systemFontOfSize:18];
        classrooomNameLabel.textColor =[UIColor blackColor];
        classrooomNameLabel.backgroundColor = [UIColor redColor];
        
        [self.contentView addSubview:classrooomNameLabel];
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame;
    
    //Avatar image
    frame = CGRectMake(10, 10, 75, 75);
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
