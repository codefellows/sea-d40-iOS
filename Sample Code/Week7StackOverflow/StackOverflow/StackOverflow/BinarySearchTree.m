//
//  BinarySearchTree.m
//  StackOverflow
//
//  Created by Bradley Johnson on 9/18/15.
//  Copyright (c) 2015 Code Fellows. All rights reserved.
//

#import "BinarySearchTree.h"
#import "Node.h"

@interface  BinarySearchTree()
@property (retain,nonatomic) Node *root;
@end

@implementation BinarySearchTree

-(BOOL)addValue:(NSInteger)value {
  if (!self.root) {
    Node *node = [[Node alloc] init];
    node.value = value;
    self.root = node;
    [node release];
    return true;
  } else {
    return [self.root addValue:value];
  }
}

-(void)dealloc {
  [_root release];
  [super dealloc];
}


@end
