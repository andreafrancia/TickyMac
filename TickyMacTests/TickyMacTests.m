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

- (void)test_from_end_date_to_remaining
{
    AppDelegate * app = [[AppDelegate alloc]init];
    app.iconForWork = @"work ";
    app.iconForRest = @"rest ";
    
    NSDate * now = [app parseDateFromString:@"2015-04-02 14:00:39 +0000"];
    
    NSString * time = [app formatRemainingWithEndFromFile:@"2015-04-02T14:25:39+0000\n"
                                                       now:now];
    XCTAssertEqualObjects(@"work 25:00", time);
}


@end
