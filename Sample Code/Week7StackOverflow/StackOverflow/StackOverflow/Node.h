//
//  Node.h
//  StackOverflow
//
//  Created by Bradley Johnson on 9/18/15.
//  Copyright (c) 2015 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject
@property (nonatomic) NSInteger value;
@property (retain,nonatomic) Node *left;
@property (retain,nonatomic) Node *right;

-(BOOL)addValue:(NSInteger)value;

@end
