//
//  HashTable.m
//  HotelManager
//
//  Created by Bradley Johnson on 9/9/15.
//  Copyright (c) 2015 Code Fellows. All rights reserved.
//

#import "HashTable.h"
#import "Bucket.h"

@interface HashTable()
@property (strong,nonatomic) NSMutableArray *items;
@end

@implementation HashTable

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.items = [[NSMutableArray alloc] init];
    for (int i = 0; i < 250; i++) {
      [self.items addObject:[[Bucket alloc] init]];
    }
  }
  return self;
}

- (NSInteger)hash:(NSString *)key {
  NSInteger total = 0;
  
  for (int i = 0; i < key.length; i++) {
    NSInteger ascii = [key characterAtIndex:i];
    total = total + ascii;
  }
  return total % self.items.count;
}

-(id)objectForKey:(NSString *)key {
  NSInteger index = [self hash:key];
  
  Bucket *bucket = self.items[index];
  
  while (bucket) {
    if ([bucket.key isEqualToString:key]) {
      return bucket.value;
    }
    bucket = bucket.next;
  }
  
  return nil;
}

-(id)removeObjectForKey:(NSString *)key {
  NSInteger index = [self hash:key];
  
  Bucket *bucket = self.items[index];
  Bucket *previousBucket;
  
  while (bucket) {
    if([bucket.key isEqualToString:key]) {
      //we have found the bucket we want to remove
      if (!previousBucket) {
        if (!bucket.next) {
          bucket.key = nil;
          id value = bucket.value;
          bucket.value = nil;
          return value;
        } else {
          id value = bucket.value;
          self.items[index] = bucket;
          return value;
        }
      } else {
        id value = bucket.value;
        previousBucket.next = bucket.next;
        return value;
      }
    }
    previousBucket = bucket;
    bucket = bucket.next;
  }
  return nil;
}

-(void)addObject:(id)object forKey:(NSString *)key {
  [self removeObjectForKey:key];
}

@end
