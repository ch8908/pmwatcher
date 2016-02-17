//
// Created by Kros Huang on 2/16/16.
// Copyright (c) 2016 oSolve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTLModel.h"
#import "MTLJSONAdapter.h"


@interface PMResponseResult : MTLModel<MTLJSONSerializing>
@property (nonatomic, readonly, copy) NSString *resourceId;
@property (nonatomic, readonly, copy) NSArray *records;
@end