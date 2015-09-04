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
#import "Reminder.h"
#import <ParseUI/ParseUI.h>


NSString *const kMyCountry = @"USA";

@interface ViewController () <CLLocationManagerDelegate, MKMapViewDelegate, PFSignUpViewControllerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong,nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reminderNotification:) name:kReminderNotification object:nil];
  
  
  self.mapView.delegate = self;
  self.mapView.showsUserLocation = true;
  
  NSLog(@"%d",[CLLocationManager authorizationStatus]);
  
  self.locationManager = [[CLLocationManager alloc] init];
  self.locationManager.delegate = self;
  [self.locationManager requestAlwaysAuthorization];
  
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
  
  
  
  Reminder *reminder = [Reminder object];
  reminder.name = @"Pizza";
  reminder.user = [PFUser currentUser];
  
  [reminder saveInBackground];
  
  PFQuery *pizzaQuery = [Reminder query];
  [pizzaQuery findObjectsInBackgroundWithBlock:^(NSArray *reminders, NSError *error) {
    
    Reminder *firstReminder = [reminders firstObject];
    NSLog(@"%@",firstReminder.name);
  }];
  
  
  if ([CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
    
    CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:CLLocationCoordinate2DMake(47.6235, -122.3363) radius:200 identifier:@"Code Fellows"];
    
    [self.locationManager startMonitoringForRegion:region];
    
   
    
    MKCircle *circle = [MKCircle circleWithCenterCoordinate:CLLocationCoordinate2DMake(47.6235, -122.3363) radius:200];
    
    [self.mapView addOverlay:circle];
    
    
//    NSArray *regions = [[self.locationManager monitoredRegions] allObjects];
    
    
  }

  // Do any additional setup after loading the view, typically from a nib.
}

-(void)reminderNotification:(NSNotification *)notification {
  NSLog(@"notification fired!");
  NSDictionary *userInfo = notification.userInfo;
  if (userInfo) {
    
    NSString *value = userInfo[@"Hello"];
    
  }
  
}

-(void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(47.6235, -122.3363), 10, 10) animated:true];
  
  MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
  annotation.coordinate = CLLocationCoordinate2DMake(47.6235, -122.3363);
  annotation.title = @"Code Fellows";
  [self.mapView addAnnotation:annotation];

}
- (IBAction)buttonPressed:(id)sender {
  
  //MKAnnotationView *view = (MKAnnotationView *)sender;
  
  //[PFUser currentUser]
  
  PFSignUpViewController *signUpVC = [[PFSignUpViewController alloc] init];
  signUpVC.delegate = self;
  [self presentViewController:signUpVC animated:true completion:nil];

}

-(void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
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
//  NSLog(@"lat: %f, long: %f, speed: %f",location.coordinate.latitude, location.coordinate.longitude, location.speed);
}

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
  NSLog(@"entered region!");
  
  UILocalNotification *notification = [[UILocalNotification alloc] init];
  
  notification.alertTitle = @"Hello";
  notification.alertBody = @"Blah blah blah";
  
  [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

#pragma mark - MKMapViewDelegate

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

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
  MKCircleRenderer *circleRenderer = [[MKCircleRenderer alloc] initWithOverlay:overlay];
  
  circleRenderer.strokeColor = [UIColor blueColor];
  circleRenderer.fillColor = [UIColor redColor];
  circleRenderer.alpha = 0.5;
  
  return circleRenderer;
}

#pragma mark - PFSignUpViewController

-(void)signUpViewController:(PFSignUpViewController * __nonnull)signUpController didSignUpUser:(PFUser * __nonnull)user {
  [signUpController dismissViewControllerAnimated:true completion:nil];
}




@end
