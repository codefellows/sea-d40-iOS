//
//  ViewController.m
//  HotelManager
//
//  Created by Bradley Johnson on 9/7/15.
//  Copyright (c) 2015 Code Fellows. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(void)loadView {
  UIView *rootView = [[UIView alloc] init];
  rootView.backgroundColor = [UIColor whiteColor];
  
  UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
  [redView setTranslatesAutoresizingMaskIntoConstraints:false];
  redView.backgroundColor = [UIColor redColor];
  [rootView addSubview:redView];
  
  UILabel *greenLabel = [[UILabel alloc] init];
  [greenLabel setTranslatesAutoresizingMaskIntoConstraints:false];
  greenLabel.text = @"Go hawks";
  greenLabel.backgroundColor = [UIColor greenColor];
  [rootView addSubview:greenLabel];
  
  NSDictionary *views = @{@"redView" : redView, @"greenLabel" : greenLabel};
  
  NSArray *redViewHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[redView]-|" options:0 metrics:nil views:views];
  [rootView addConstraints:redViewHorizontalConstraints];
  
  NSArray *redViewVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[redView]-100-|" options:0 metrics:nil views:views];
  [rootView addConstraints:redViewVerticalConstraints];
  
  NSArray *greenLabelVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[redView]-[greenLabel]" options:0 metrics:nil views:views];
  [rootView addConstraints:greenLabelVerticalConstraints];
  
//  NSArray *greenLabelHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[greenLabel]" options:0 metrics:nil views:views];
//  [rootView addConstraints:greenLabelHorizontalConstraints];
  NSLayoutConstraint *greenLabelCenterXConstraint = [NSLayoutConstraint constraintWithItem:greenLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  //[rootView addConstraint:greenLabelCenterXConstraint];
  greenLabelCenterXConstraint.active = true;
  
  
  
  
  
  self.view = rootView;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  
  // Do any additional setup after loading the view, typically from a nib.
}



@end
