//
// Created by Kros Huang on 2/16/16.
// Copyright (c) 2016 oSolve. All rights reserved.
//

#import "PMResponse.h"
#import "PMResponseResult.h"

@implementation PMResponse
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
      @"result" : @"result",
    };
}

+ (NSValueTransformer *)resultJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[PMResponseResult class]];
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString string];
    [description appendFormat:@"self.result=%@", self.result];

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