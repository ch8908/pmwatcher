//
// Created by wish8 on 1/8/16.
// Copyright (c) 2016 oSolve. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PMService : NSObject
- (void)fetchDataWithCompletion:(void (^)(NSArray *, NSError *)) completion;
@end