//
// Created by Kros Huang on 2/16/16.
// Copyright (c) 2016 oSolve. All rights reserved.
//

#import "PMRecord.h"

@implementation PMRecord

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
      @"siteName" : @"SiteName",
      @"pm25" : @"PSI",
    };
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString string];
    [description appendFormat:@"self.siteName=%@", self.siteName];
    [description appendFormat:@", self.pm25=%@", self.pm25];

    NSMutableString *superDescription = [[super description] mutableCopy];
    NSUInteger length = [superDescription length];

    if (length > 0 && [superDescription characterAtIndex:length - 1] == '>') {
        [superDescription insertString:@", " atIndex:length - 1];
        [superDescription insertString:description atIndex:length + 1];
        return superDescription;
    }
    else {
        return [NSString stringWithFormat:@"<%@: %@>", NSStringFromClass([self class]), description];
    }
}

@end