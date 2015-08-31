//
//  ViewController.m
//  MyDemo
//
//  Created by Bradley Johnson on 8/31/15.
//  Copyright (c) 2015 CF. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic) CGRect layout;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSString *myName = @"Brad";
  
  NSLog(@"my name is: %@ %@",myName, myName);
  
  UIView *redView = [[UIView alloc] init];
  UIView *dontDoThisView = [UIView new];
  [self.view addSubview:redView];
  
  Person *person = [[Person alloc] init];
  
  [person setName:@"Bradley"]; //using the setter
  [person name]; //using the getter
  
  person.name = @"Brad"; //dot syntax to set name property
  NSString *anotherName = person.name;
  
  //person.SSN = @3545;
  [person changeSSN];
  
  [person changeName:@"Chad" andChangeSSN:@5432413 andChangeAge:@1000];
  
  Person *newPerson = [[Person alloc] initWithName:@"Brad" age:@3435 SSN:@3353545];
  
  Person *friend = [[Person alloc] initWithName:@"Russ" age:@27 SSN:@434355];
  [newPerson.friends addObject:friend];
  
  NSArray *numbers = @[@2,@4,@5,@43,@4];
  NSMutableArray *friends = [NSMutableArray arrayWithObjects:@"Russ",@"Pete",nil];
  
//  CGRect frame = CGRectMake(0, 0, 0, 0);
//  int num = 32;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
