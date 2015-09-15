//
//  Question.h
//  StackOverflow
//
//  Created by Bradley Johnson on 9/15/15.
//  Copyright © 2015 Code Fellows. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Question : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *avatarURL;
@property (strong, nonatomic) UIImage *avatarPic;
@property (strong, nonatomic) NSString *ownerName;


@end
