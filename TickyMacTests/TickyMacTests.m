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

@implementation TickyMacTests {
    AppDelegate * app;
}

- (void)setUp
{
    [super setUp];
    
    app = [[AppDelegate alloc]init];
    app.iconForWork = @"work ";
    app.iconForRest = @"rest ";
    app.iconForSleep = @"sleep ";
}

- (void)test_from_end_date_to_remaining
{
    NSDate * now = [app parseDateFromString:@"2015-04-02 14:00:39 +0000"];
    
    NSString * time = [app formatRemainingWithEndFromFile:@"2015-04-02T14:25:39+0000\n"
                                                       now:now];
    XCTAssertEqualObjects(@"work 25:00", time);
}

-(void)test_remaining_rendering
{
    XCTAssertEqualObjects(@"work 25:00", [app formatRemaining:25*60]);
    XCTAssertEqualObjects(@"work 10:00", [app formatRemaining:10*60]);
    XCTAssertEqualObjects(@"work 00:00", [app formatRemaining: 0*60]);
    XCTAssertEqualObjects(@"rest 01:00", [app formatRemaining:-(1*60)]);
    XCTAssertEqualObjects(@"rest 24:59", [app formatRemaining:-(24*60+59)]);
    XCTAssertEqualObjects(@"sleep 25:00", [app formatRemaining:-(25*60)]);
    XCTAssertEqualObjects(@"sleep 25:01", [app formatRemaining:-(25*60+1)]);
}

@end
