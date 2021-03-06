//
//  MapViewController.m
//  MapProject
//
//  Created by xcode on 2015-04-15.
//  Copyright (c) 2015 Alex Estrop. All rights reserved.
//

#import "MapViewController.h"
#import "FavRooms.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "MapViewAnnotation.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapView, locationManager, mainDelegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [mainDelegate readFavDataFromDatabase];
    
    [mapView setMapType:MKMapTypeHybrid];
    [mapView setZoomEnabled:YES];
    [mapView setScrollEnabled:YES];
    MKCoordinateRegion region = {{0.0,0.0},{0.0,0.0}};
    region.center.latitude = 43.468581;
    region.center.longitude = -79.699934;
    region.span.latitudeDelta = 0.01f;
    region.span.longitudeDelta = 0.01f;
    [mapView setRegion:region animated:YES];
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.mapView addAnnotations:[self createAnnotations]];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [mainDelegate readFavDataFromDatabase];
    NSMutableArray *annotations = [NSMutableArray array];
    for (id annotation in [mapView annotations])
    {
        [annotations addObject:annotation];
    }
    [self.mapView removeAnnotations:annotations];
    [self.mapView addAnnotations:[self createAnnotations]];
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

-(NSMutableArray *)createAnnotations
{
    NSMutableArray *annotations = [[NSMutableArray alloc]init];
    CLLocationCoordinate2D coord;
    FavRooms *data;
    
    NSLog(@"in createAnnotations");
    for(int i = 0; i<mainDelegate.favRoom.count; i++){
        NSLog(@"in for loop");
        data = [mainDelegate.favRoom objectAtIndex:i];
        
        NSNumber *lat = [[NSNumber alloc] initWithDouble:[[data latitude] doubleValue]];
        NSNumber *lon = [[NSNumber alloc] initWithDouble:[[data longitude] doubleValue]];
        NSString *roomNum = [data room];
        
        coord.latitude = lat.doubleValue;
        coord.longitude = lon.doubleValue;
        NSLog(@"room Number: %@", roomNum);
        
        MapViewAnnotation *annotation = [[MapViewAnnotation alloc] initWithTitle:roomNum AndCoordinate:coord];
        [annotations addObject:annotation];
    }
    
    if ([mainDelegate roomToView] != nil)
        [annotations addObject:[self addRoomToMap]];

    
    return annotations;
}

-(MapViewAnnotation *)addRoomToMap {
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    
    NSNumber *lat = [f numberFromString:[[mainDelegate roomToView] latitude]];
    NSNumber *lon = [f numberFromString:[[mainDelegate roomToView] longitude]];
    
    NSString *roomNum = [[mainDelegate roomToView] roomNumber];
    
    if ([mainDelegate roomToView] != nil) {
        CLLocationCoordinate2D coord;
        
        coord.latitude = lat.doubleValue;
        coord.longitude = lon.doubleValue;
        
        MapViewAnnotation *annotation = [[MapViewAnnotation alloc] initWithTitle:roomNum AndCoordinate:coord];
        
        return annotation;
    }
    
    
    
    return nil;
    
}


-(IBAction)unwindToThisViewController:(UIStoryboardSegue *) sender
{
    
}

@end