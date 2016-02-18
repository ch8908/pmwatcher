//
// Created by wish8 on 1/8/16.
// Copyright (c) 2016 oSolve. All rights reserved.
//

#import "PMService.h"
#import "AFHTTPSessionManager.h"
#import "MTLModel.h"
#import "MTLJSONAdapter.h"
#import "PMRecord.h"

@implementation PMService
- (void)fetchDataWithCompletion:(void (^)(NSArray *, NSError *)) completion {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:@"http://localhost:3000/records"
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask *task, id responseObject) {
             if (completion) {
                 completion([MTLJSONAdapter modelsOfClass:[PMRecord class] fromJSONArray:responseObject
                                                    error:nil], nil);
             }
         }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             if (completion) {
                 completion(nil, error);
             }
         }];
}
@end