//
//  DetailViewController.m
//  MemoryLeak
//
//  Created by Bradley Johnson on 9/1/15.
//  Copyright (c) 2015 CF. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (strong,nonatomic) NSMutableArray *items;
@property (copy,nonatomic) void(^myBlock)(int);

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.items = [[NSMutableArray alloc] init];
  
  
  __weak DetailViewController *weakSelf = self;
  self.myBlock = ^void(int i) {
    if (weakSelf) {
    weakSelf.title = @"Detail";
    }
  };
  
  for (int i = 0; i < 1000000; i++) {
    NSString *number = [NSString stringWithFormat:@"%d",i];
    [self.items addObject:number];
  }
  
    // Do any additional setup after loading the view.
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
