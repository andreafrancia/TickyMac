
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
    self.item.title = [self readTimeboxEnd];
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

@end
