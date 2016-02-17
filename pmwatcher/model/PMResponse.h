//
// Created by Kros Huang on 2/16/16.
// Copyright (c) 2016 oSolve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@class PMResponseResult;

@interface PMResponse : MTLModel<MTLJSONSerializing>
@property (nonatomic, readonly, strong) PMResponseResult *result;
@end