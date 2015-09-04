//
//  Node.h
//  LocationReminders
//
//  Created by Bradley Johnson on 9/3/15.
//  Copyright (c) 2015 CF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (strong,nonatomic) id value;
@property (strong,nonatomic) Node *next;

@end
