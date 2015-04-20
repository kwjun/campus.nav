//
//  MapViewController.h
//  MapProject
//
//  Coded by Peter
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "AppDelegate.h"

@interface MapViewController : UIViewController
{
    IBOutlet MKMapView *mapView;
    CLLocationManager *locationManager;
    AppDelegate *mainDelegate;
}

@property(strong, nonatomic)IBOutlet MKMapView *mapView;
@property(strong, nonatomic)CLLocationManager *locationManager;
@property(strong, nonatomic)AppDelegate *mainDelegate;

-(NSMutableArray *)createAnnotations;


@end