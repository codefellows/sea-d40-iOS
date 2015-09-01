//
//  ViewController.m
//  LocationReminders
//
//  Created by Bradley Johnson on 8/31/15.
//  Copyright (c) 2015 CF. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "Constants.h"
#import <CoreLocation/CoreLocation.h>
#import <Parse/Parse.h>

NSString *const kMyCountry = @"USA";

@interface ViewController () <CLLocationManagerDelegate, MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong,nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.mapView.delegate = self;
  self.mapView.showsUserLocation = true;
  
  NSLog(@"%d",[CLLocationManager authorizationStatus]);
  
  self.locationManager = [[CLLocationManager alloc] init];
  self.locationManager.delegate = self;
  [self.locationManager requestWhenInUseAuthorization];
  
  [self.locationManager startUpdatingLocation];
  
  PFGeoPoint *geoPoint = [PFGeoPoint geoPointWithLatitude:47.6235 longitude:-122.3363];
  PFObject *place = [[PFObject alloc] initWithClassName:@"Place"];
  place[@"location"] = geoPoint;
  place[@"name"] = @"Code Fellows";
  
  [place saveInBackground];
  
  [place saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
    if (error) {
      
    } else if (succeeded) {
      
    }
  }];
  
  PFQuery *query = [PFQuery queryWithClassName:@"Place"];
  
  [query whereKey:@"location" nearGeoPoint:geoPoint];
  
  [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
    NSLog(@"%lu",(unsigned long)objects.count);
  }];
  
  
                                                                             
  
  // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(47.6235, -122.3363), 10, 10) animated:true];
  
  MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
  annotation.coordinate = CLLocationCoordinate2DMake(47.6235, -122.3363);
  annotation.title = @"Code Fellows";
  [self.mapView addAnnotation:annotation];

}

#pragma mark - CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status  {
  
  switch (status) {
    case kCLAuthorizationStatusAuthorizedWhenInUse :
      [self.locationManager startUpdatingLocation];
      break;
    default:
      break;
  }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
  
  CLLocation *location = locations.lastObject;
  NSLog(@"lat: %f, long: %f, speed: %f",location.coordinate.latitude, location.coordinate.longitude, location.speed);
 
  
}

#pragma mark - CLLocationManagerDelegate

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
  
  if ([annotation isKindOfClass:[MKUserLocation class]]) {
    return nil;
  }

  MKPinAnnotationView *pinView =(MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"AnnotationView"];
 pinView.annotation = annotation;
  
  if (!pinView) {
    pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"AnnotationView"];
  }

  pinView.animatesDrop = true;
  pinView.pinColor = MKPinAnnotationColorPurple;
  
  return pinView;
  
}


@end
