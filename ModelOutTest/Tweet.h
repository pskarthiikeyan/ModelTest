//
//  Tweet.h
//  ModelOutTest
//
//  Created by Karthiik PS on 07/08/16.
//  Copyright © 2016 Karthiik PS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : NSObject
@property(nonatomic, strong) NSString *idStr;
@property(nonatomic, strong) NSString *text;
@property(nonatomic, strong) NSDate *createdAt;

@end
