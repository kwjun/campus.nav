//
//  FavouritesViewController.m
//  MapProject
//
// Created by Peter
//

#import "FavouritesViewController.h"

@interface FavouritesViewController ()
@end

@implementation FavouritesViewController

@synthesize mainDelegate, selectedIndex, tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [mainDelegate readFavDataFromDatabase];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

-(IBAction)unwindToThisViewController:(UIStoryboardSegue *) sender
{
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [mainDelegate.favRoom count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell==nil)
    {
        //Use UITableViewCellStyleSubtitle instead of default to show detailTextLabel
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    NSInteger row = [indexPath row];
    FavRooms *data = [mainDelegate.favRoom objectAtIndex:row];
    
    cell.textLabel.text = [data room];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@", [data latitude], [data longitude]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void) tableView: (UITableView *) tableView2 didSelectRowAtIndexPath: (NSIndexPath *) indexPath
{
    UIAlertView *alert = [[UIAlertView  alloc]
                          initWithTitle:@"Delete Record"
                          message:@"Are you sure you want to delete this record?"
                          delegate:self
                          cancelButtonTitle:@"Cancel"
                          otherButtonTitles:@"Delete", nil];
    
    alert.tag = 1;
    [alert show];
    selectedIndex = [tableView2 indexPathForSelectedRow];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    FavRooms *room = [mainDelegate.favRoom objectAtIndex:selectedIndex.row];
    if(buttonIndex == [alertView cancelButtonIndex])
    {
        NSLog(@"%@", room.room);
    }
    else
    {
        [mainDelegate deleteFromDb:room];
        
        
    }
}


@end
