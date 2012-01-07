//
//  MainController.m
//  Memekitty
//
//  Created by Daniel Sundström on 1/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MainController.h"


@implementation MainController

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(void)awakeFromNib{
    statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength] retain];
    NSBundle *bundle = [NSBundle mainBundle];
    statusImage = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"cat-icon" ofType:@"png"]];
    [statusItem setImage:statusImage];
    [statusItem setMenu:statusMenu];
    [statusItem setToolTip:@"Magic!"];
    [statusItem setHighlightMode:YES];
}

-(void)negerkung:(NSString*)kalle{
    NSLog(@"%@",kalle);
}

-(IBAction)helloWorld:(id)sender{
    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    [pb clearContents];
    [pb writeObjects:[NSArray arrayWithObjects:[NSImage imageNamed:@"bild4.jpeg"], @"bongo.jpg", nil]];
}

- (void)dealloc
{
    [statusImage release];
    [super dealloc];
}

@end
