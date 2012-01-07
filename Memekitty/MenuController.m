//
//  MenuController.m
//  Memekitty
//
//  Created by Daniel Sundström on 2012-01-07.
//  Copyright (c) 2012 Qubator. All rights reserved.
//

#import "MenuController.h"

@implementation MenuController

@synthesize statusItem;

-(void)awakeFromNib{
    
    if(self.statusItem == nil){
        self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
        [self.statusItem retain];
        NSBundle *bundle = [NSBundle mainBundle];
        statusImage = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"cat-icon" ofType:@"png"]];
        [self.statusItem setImage:statusImage];
        [self.statusItem setToolTip:@"Magic!"];
        [self.statusItem setHighlightMode:YES];        
        [self.statusItem setMenu:statusMenu];
    }
    
}


@end