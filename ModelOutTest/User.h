//
//  User.h
//  ModelOutTest
//
//  Created by Karthiik PS on 07/08/16.
//  Copyright © 2016 Karthiik PS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property(nonatomic, strong) NSString *idStr;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *screenName;
@property(nonatomic, strong) NSString *location;
@property(nonatomic, strong) NSString *descriptionValue;
@property(nonatomic, strong) NSURL *url;
@property(nonatomic) BOOL protected;
@property(nonatomic, strong) NSNumber *followersCount;
@property(nonatomic, strong) NSDate *createdAt;

@property(nonatomic, strong) NSArray *tweets;

@end
