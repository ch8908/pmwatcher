//
//  pmwatcherTests.m
//  pmwatcherTests
//
//  Created by wish8 on 1/8/16.
//  Copyright © 2016 oSolve. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PMRecord.h"
#import "PMRecordViewModel.h"

@interface pmwatcherTests : XCTestCase
+ (pmwatcherTests *)instance;


@end

@implementation pmwatcherTests
+ (pmwatcherTests *)instance {
    static pmwatcherTests *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testRecordViewModel {
    PMRecord *record = [[PMRecord alloc] initWithSiteName:@"大安區" pm25:@"100"];
    PMRecordViewModel *viewModel = [[PMRecordViewModel alloc] initWithRecord:record];
    XCTAssertEqualObjects(@"大安區，PM2.5:100", viewModel.recordDescription);
    XCTAssertEqualObjects([UIColor redColor], viewModel.recordColor);
}

- (void)testRecordViewModel_green {
    PMRecord *record = [[PMRecord alloc] initWithSiteName:@"大安區" pm25:@"10"];
    PMRecordViewModel *viewModel = [[PMRecordViewModel alloc] initWithRecord:record];
    XCTAssertEqualObjects(@"大安區，PM2.5:10", viewModel.recordDescription);
    XCTAssertEqualObjects([UIColor greenColor], viewModel.recordColor);
}


@end
