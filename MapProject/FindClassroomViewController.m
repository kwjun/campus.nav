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
    return [dbDelegate.classrooms count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSInteger row = [indexPath row];
    
    Classroom *classroom = [dbDelegate.classrooms objectAtIndex:row];
    
    cell.textLabel.text = [classroom name];
    
    
    return cell;
    
}

#pragma mark Application Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
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