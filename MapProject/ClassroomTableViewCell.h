//
//  ClassroomTableViewCell.h
//  MapProject
//
//  Created by Gordon Cox
//
//
#import <UIKit/UIKit.h>

@interface ClassroomTableViewCell : UITableViewCell {
    UILabel *roomNumberLabel;
    UILabel *classrooomNameLabel;
    UILabel *latitudeLabel;
    UILabel *longitudeLabel;
    UILabel *roomDescriptionLabel;

}

@property (nonatomic, strong) UILabel *roomNumberLabel;
@property (nonatomic, strong) UILabel *classrooomNameLabel;
@property (nonatomic, strong) UILabel *latitudeLabel;
@property (nonatomic, strong) UILabel *longitudeLabel;
@property (nonatomic, strong) UILabel *roomDescriptionLabel;

@end
