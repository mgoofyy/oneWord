//
//  GFLoginRacTest.m
//  oneWord
//
//  Created by goofygao on 6/7/16.
//  Copyright © 2016 goofyy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GFHTTPManger+GFLoginRAC.h"
#import "ReactiveCocoa/ReactiveCocoa.h"

@interface GFLoginRacTest : XCTestCase

@end

@implementation GFLoginRacTest

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

- (void)testLoginTest {
//    [GFHTTPManger rac_login:@"/base" params:@{}]
//    [RACObserve(self, key) sub]
}

@end
