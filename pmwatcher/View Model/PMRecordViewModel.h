//
// Created by wish8 on 2/18/16.
// Copyright (c) 2016 oSolve. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PMRecord;


@interface PMRecordViewModel : NSObject
@property (nonatomic, strong) UIColor *recordColor;
@property (nonatomic, copy) NSString *recordDescription;

- (instancetype)initWithRecord:(PMRecord *) record;

@end