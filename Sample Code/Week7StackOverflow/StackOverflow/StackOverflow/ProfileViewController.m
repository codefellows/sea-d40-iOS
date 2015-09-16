//
//  ProfileViewController.m
//  StackOverflow
//
//  Created by Bradley Johnson on 9/16/15.
//  Copyright © 2015 Code Fellows. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@property (retain,nonatomic) NSString *myName;
@property (assign,nonatomic) NSNumber *myNumber;
@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  NSString *myString = [[NSString stringWithFormat:@"Hi"] retain];
  
  self.myName = myString;
  
//  self.myName = myString;
  [myString release]; //down to 2
  
    // Do any additional setup after loading the view.
}

-(void)dealloc {
  [_myName release];
  [super dealloc];
}

@end
