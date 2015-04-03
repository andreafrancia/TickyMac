//
//  AppDelegate.h
//  TickyMac
//
//  Created by Andrea Francia on 4/2/15.
//  Copyright (c) 2015 Andrea Francia. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (copy) NSString* iconForWork;
@property (copy) NSString* iconForRest;
- (NSString*)readTimeboxEnd;
- (NSString*)formatRemainingWithEndFromFile:(NSString*)endFromFile now:(NSDate*)now;
- (NSDate*) parseDateFromString:(NSString*)iso8601date;
@end

