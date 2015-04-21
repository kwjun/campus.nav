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
        
        Classroom *newRoom = [[Classroom alloc] initWithData:roomNumberTF.text theName:roomNameTF.text theLatitude:latitudeTF.text theLongitude:longitudeTF.text theDescription:descriptionTF.text];
        
        NSString* message = [NSString stringWithFormat:@"Added to database: \nRoom Number: %@\nRoom Name: %@\nLongitude: %@\nLatitude: %@\nRoomDescription: %@\n", newRoom.roomNumber, newRoom.name, newRoom.longitude, newRoom.latitude, newRoom.roomDescription];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Add to database?" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        
        alert.tag = 1;
        [alert show];
        
        [dbDelegate insertIntoDatabase:newRoom];
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
