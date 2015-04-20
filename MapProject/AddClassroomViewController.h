//
//  AddClassroomViewController.h
//  MapProject
//
//  Created by Gordon Cox
//
//


#import "ViewController.h"
#import "AppDelegate.h"

@interface AddClassroomViewController : ViewController {
    AppDelegate *dbDelegate;
    
    IBOutlet UITextField *roomNumberTF;
    IBOutlet UITextField *roomNameTF;
    IBOutlet UITextField *longitudeTF;
    IBOutlet UITextField *latitudeTF;
    IBOutlet UITextField *descriptionTF;
    IBOutlet UIButton *addRoomButton;
}

@property (nonatomic, strong) AppDelegate *dbDelegate;

@property (nonatomic, strong) IBOutlet UITextField *roomNumberTF;
@property (nonatomic, strong) IBOutlet UITextField *roomNameTF;
@property (nonatomic, strong) IBOutlet UITextField *longitudeTF;
@property (nonatomic, strong) IBOutlet UITextField *latitudeTF;
@property (nonatomic, strong) IBOutlet UITextField *descriptionTF;
@property (nonatomic, strong) IBOutlet UIButton *addRoomButton;

-(IBAction)addRoomToDatabase:(id)sender;
-(IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue;

@end
