//
// Created by Kros Huang on 2/16/16.
// Copyright (c) 2016 oSolve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTLModel.h"
#import "MTLJSONAdapter.h"


@interface PMRecord : MTLModel<MTLJSONSerializing>
@property (nonatomic, readonly, copy) NSString *siteName;
@property (nonatomic, readonly, copy) NSString *pm25;

- (instancetype)initWithSiteName:(NSString *) siteName pm25:(NSString *) pm25;

@end