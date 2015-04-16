//
//  ClassroomTableViewCell.m
//  MapProject
//
//  Created by xcode on 2015-04-15.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import "ClassroomTableViewCell.h"

@implementation ClassroomTableViewCell

@synthesize clasrooomNameLabel;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        clasrooomNameLabel = [[UILabel alloc]init];
        clasrooomNameLabel.textAlignment = NSTextAlignmentLeft;
        clasrooomNameLabel.font = [UIFont systemFontOfSize:18];
        clasrooomNameLabel.textColor =[UIColor whiteColor];
        clasrooomNameLabel.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:clasrooomNameLabel];
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame;
    
    //Avatar image
    frame = CGRectMake(10, 10, 75, 75);
    clasrooomNameLabel.frame = frame;
    
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
