//
// Created by wish8 on 1/8/16.
// Copyright (c) 2016 oSolve. All rights reserved.
//

#import "PMService.h"
#import "AFHTTPSessionManager.h"


@implementation PMService
- (void)fetchDataWithCompletion:(void (^)(NSArray *, NSError *)) completion {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    [manager GET:@"http://opendata.epa.gov.tw/webapi/api/rest/datastore/355000000I-000002?sort=MonitorDate&offset=0&limit=1000"
      parameters:nil progress:nil
         success:^(NSURLSessionDataTask *task, id responseObject) {
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