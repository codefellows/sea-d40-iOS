//
//  HashTable.h
//  HotelManager
//
//  Created by Bradley Johnson on 9/9/15.
//  Copyright (c) 2015 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HashTable : NSObject

-(id)objectForKey:(NSString *)key;
-(id)removeObjectForKey:(NSString *)key;

@end
