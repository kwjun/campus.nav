//
//  AddFavouritesViewController.m
//  MapProject
//
//  Created by xcode on 2015-04-15.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import "AddFavouritesViewController.h"
#import "FavRooms.h"
#import "MapViewController.h"

@interface AddFavouritesViewController ()

@end

@implementation AddFavouritesViewController
@synthesize mainDelegate, tfLat, tfRoom, tfLon, mvc;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    mvc = (MapViewController *)[[UIApplication sharedApplication] delegate];

    [tfRoom setDelegate:self];
    [tfLat setDelegate:self];
    [tfLon setDelegate:self];
    
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [tfRoom resignFirstResponder];
    [tfLon resignFirstResponder];
    [tfLat resignFirstResponder];
    return YES;
}


-(IBAction)addPerson:(id)sender
{
    if(tfRoom.text.length == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Empty Input" message:@"Fields can not be empty" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        alert.tag = 2;
        [alert show];
    }
    else
    {
        FavRooms *froom = [[FavRooms alloc] initWithData:tfRoom.text roomLat:tfLat.text roomLong:tfLon.text];
        NSLog(@"%@, %@, %@,", froom.room, froom.latitude, froom.longitude);
        [mainDelegate insertIntoFavDatabase:froom];
        [mainDelegate readFavDataFromDatabase];
        //[mvc createAnnotations];

        UIAlertView *alert = [[UIAlertView  alloc]
                              initWithTitle:@"SQlite Insert"
                              message:@"Room Added"
                              delegate:self
                              cancelButtonTitle:@"Ok"
                              otherButtonTitles: nil];
    
        alert.tag = 1;
        [alert show];
    }
}

-(IBAction)unwindToThisViewController:(UIStoryboardSegue *) sender
{
    
}



- (void)didReceiveMemoryWarning
{
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
