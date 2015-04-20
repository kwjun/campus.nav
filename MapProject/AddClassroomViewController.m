//
//  AddClassroomViewController.m
//  MapProject
//
//  Created by Gordon Cox
//
//


#import "AddClassroomViewController.h"

@interface AddClassroomViewController ()

@end

@implementation AddClassroomViewController

@synthesize dbDelegate, roomNumberTF, roomNameTF, longitudeTF, latitudeTF, descriptionTF, addRoomButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    dbDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

-(IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue {
    
}

-(IBAction)addRoomToDatabase:(id)sender {
    
    int exit = 0;
    
    if ([self checkEmpty:roomNumberTF.text])
        exit = 1;
    
    if ([self checkEmpty:roomNameTF.text])
        exit = 1;
    
    if ([self checkEmpty:longitudeTF.text])
        exit = 1;

    if ([self checkEmpty:latitudeTF.text])
        exit = 1;
    
    if ([self checkEmpty:descriptionTF.text])
        exit = 1;
    
    if (exit == 0) {
        NSLog(@"Added something to database");
        [dbDelegate insertIntoDatabase:[[Classroom alloc] initWithData:roomNumberTF.text theName:roomNameTF.text theLatitude:latitudeTF.text theLongitude:latitudeTF.text theDescription:descriptionTF.text]];
    } else {
        //Error, empty
        NSLog(@"Did not add something to database");
    }
    
    [dbDelegate readFromDatabase];

}

-(BOOL)checkEmpty:(NSString *)check {
    
    if ([check isEqualToString:@""])
        return YES;
    
    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
