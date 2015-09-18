//
//  Node.m
//  StackOverflow
//
//  Created by Bradley Johnson on 9/18/15.
//  Copyright (c) 2015 Code Fellows. All rights reserved.
//

#import "Node.h"

@implementation Node

-(BOOL)addValue:(NSInteger)value {
  if (value == self.value) {
    return false;
  } else if (value > self.value) {
    //go to right
    if (!self.right) {
      Node *node = [[Node alloc] init];
      node.value = value;
      self.right = node;
      [node release];
      return true;
    } else {
      return [self.right addValue:value];
    }
  } else {
    if (!self.left) {
      Node *node = [[Node alloc]init];
      node.value = value;
      self.left = node;
      [node release];
      return true;
    } else {
      return [self.left addValue:value];
    }
  }
}

@end
