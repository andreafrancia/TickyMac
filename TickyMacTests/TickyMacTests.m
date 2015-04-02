//
//  TickyMacTests.m
//  TickyMacTests
//
//  Created by Andrea Francia on 4/2/15.
//  Copyright (c) 2015 Andrea Francia. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#import "AppDelegate.h"

@interface TickyMacTests : XCTestCase

@end

@implementation TickyMacTests

- (void)testExample {
    NSString * contents = @"2015-04-02T14:09:39+0200\n";
    
    XCTAssertEqualObjects(@"2015-04-02T14:09:39+0200\n", contents);
}

@end
