//
// Created by Kros Huang on 2/16/16.
// Copyright (c) 2016 oSolve. All rights reserved.
//

#import "PMResponseResult.h"
#import "PMRecord.h"

@implementation PMResponseResult
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
      @"resourceId" : @"resource_id",
      @"records" : @"records",
    };
}

+ (NSValueTransformer *)recordsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[PMRecord class]];
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString string];
    [description appendFormat:@"self.resourceId=%@", self.resourceId];
    [description appendFormat:@", self.records=%@", self.records];

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