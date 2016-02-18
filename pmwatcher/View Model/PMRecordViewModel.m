//
// Created by wish8 on 2/18/16.
// Copyright (c) 2016 oSolve. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMRecordViewModel.h"
#import "PMRecord.h"


@implementation PMRecordViewModel
- (instancetype)initWithRecord:(PMRecord *) record {
    self = [super init];
    if (self) {
        _recordDescription = [NSString stringWithFormat:@"%@，PM2.5:%@", record.siteName, record.pm25];
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *pm25 = [formatter numberFromString:record.pm25];
        if (pm25.integerValue <= 35) {
            _recordColor = [UIColor greenColor];
        } else if (pm25.integerValue <= 53) {
            _recordColor = [UIColor yellowColor];
        } else {
            _recordColor = [UIColor redColor];
        }
    }
    return self;
}

@end