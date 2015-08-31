//
//  ViewController.m
//  LocationReminders
//
//  Created by Bradley Johnson on 8/31/15.
//  Copyright (c) 2015 CF. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  

  
  // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(47.6235, -122.3363), 10, 10) animated:true];
  
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
