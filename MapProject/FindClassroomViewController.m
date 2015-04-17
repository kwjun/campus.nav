//
//  FindClassroomViewController.m
//  MapProject
//
//  Created by Gordon Cox
//
//

#import "FindClassroomViewController.h"
#import "Classroom.h"
#import "ClassroomTableViewCell.h"

@interface FindClassroomViewController ()

@end

@implementation FindClassroomViewController

@synthesize mainDelegate;

#pragma mark Table Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [mainDelegate.classrooms count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellIdentifier = @"Cell";
    
    ClassroomTableViewCell *cell = (ClassroomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil)
    {
        cell = [[ClassroomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSInteger row = [indexPath row];
    
    Classroom *classroom = [mainDelegate.classrooms objectAtIndex:row];
    
    cell.classrooomNameLabel.text = [classroom name];
    
    
    return cell;
    
}

#pragma mark Application Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [mainDelegate readFromDatabase];
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