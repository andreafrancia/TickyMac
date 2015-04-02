
//
//  AppDelegate.m
//  TickyMac
//
//  Created by Andrea Francia on 4/2/15.
//  Copyright (c) 2015 Andrea Francia. All rights reserved.
//

#import "AppDelegate.h"

@interface NSStatusBar (NSStatusBar_Private)
- (id)_statusItemWithLength:(float)l withPriority:(int)p;
@end

@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;
@property (strong) NSStatusItem * item;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // add the item to the status bar
    self.item = [self  alwaysVisibleStatusItem];
    self.item.title = [self formatRemainingWithEndFromFile:[self readTimeboxEnd]
                                                       now:[NSDate date]];
}

- (NSStatusItem *)alwaysVisibleStatusItem {
    int priority = INT_MAX - 2;
    NSStatusBar * bar = [NSStatusBar systemStatusBar];

    if ([bar respondsToSelector:@selector(_statusItemWithLength:withPriority:)]) {
        NSStatusItem * item = [bar _statusItemWithLength:0 withPriority:priority];
        [item setLength:NSVariableStatusItemLength];
        return item;
    }

    return [bar statusItemWithLength:NSVariableStatusItemLength];
}

-(NSString*)readTimeboxEnd
{
    NSString * homeDir = NSHomeDirectory();
    NSString * filename = [homeDir stringByAppendingPathComponent:@".ticky/last/end"];
    
    return [NSString stringWithContentsOfFile:filename encoding:NSUTF8StringEncoding error:nil];
}

- (NSString*)formatRemainingWithEndFromFile:(NSString*)endFromFile now:(NSDate*)now
{
    NSDate * end = [self parseDateFromString:[self trimString:endFromFile]];
    NSTimeInterval remaining = [end timeIntervalSinceDate:now];
    NSInteger mm = ((NSInteger)round(remaining)) / 60;
    NSInteger ss = ((NSInteger)round(remaining)) % 60;
    return [NSString stringWithFormat:@"%02ld:%02ld", mm, ss];
}

- (NSDate*) parseDateFromString:(NSString*)iso8601date
{
    for(NSString * format in @[
                               @"yyyy-MM-dd'T'HH:mm:ssZ",
                               @"yyyy-MM-dd HH:mm:ss Z"
                               ] ) {
        NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
        formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
        formatter.dateFormat = format;
        formatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
        NSDate * date = [formatter dateFromString:iso8601date];
        if (date) return date;
    }
    return nil;
}

- (NSString*) trimString:(NSString*)contents
{
    NSCharacterSet * charsToTrim = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [contents stringByTrimmingCharactersInSet:charsToTrim];
}

@end
