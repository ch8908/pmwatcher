//
// Created by wish8 on 1/8/16.
// Copyright (c) 2016 oSolve. All rights reserved.
//

#import "PMService.h"
#import "AFHTTPSessionManager.h"
#import "MTLModel.h"
#import "MTLJSONAdapter.h"
#import "PMResponse.h"

@implementation PMService
- (void)fetchDataWithCompletion:(void (^)(NSArray *, NSError *)) completion {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:@"http://opendata.epa.gov.tw/webapi/api/rest/datastore/355000000I-000001/?format=json"
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask *task, id responseObject) {
             NSError *error = nil;
             PMResponse *pmResponse = [MTLJSONAdapter modelOfClass:[PMResponse class] fromJSONDictionary:responseObject error:&error];
             NSLog(@">>>>>>>>>>>> pmResponse = %@", pmResponse);
             if (completion) {
                 completion(responseObject, nil);
             }
         }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             if (completion) {
                 completion(nil, error);
             }
         }];
}
@end