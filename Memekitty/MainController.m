//
//  MainController.m
//  Memekitty
//
//  Created by Daniel Sundström on 1/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MainController.h"
#import "MemekittyAppDelegate.h"

@implementation MainController

@synthesize popBtn, imgView;


- (id)init
{
    self = [super init];
    if (self) {
        NSLog(@"Hugo");
    }
    return self;
}


-(void)awakeFromNib{
}

- (void)windowWillClose:(NSNotification *)notification{
    [[NSApplication sharedApplication].delegate saveDataToDisk];
}

-(IBAction)selectImage:(id)sender{
    NSMenuItem *itm = [popBtn selectedItem];
    [imgView setImage:[[[NSApplication sharedApplication].delegate images] objectForKey:[itm title]]];   
}

-(IBAction)imageDropped:(id)sender{
    NSMenuItem *itm = [popBtn selectedItem];
    [[[NSApplication sharedApplication].delegate images] setObject:[sender image] forKey:[itm title]];
    NSLog(@"%@", [[[NSApplication sharedApplication].delegate images] description]);
}

-(IBAction)edit:(id)sender{
    NSWindowController *ctrl = [[NSWindowController alloc] initWithWindowNibName:@"EditWindow"];
    [ctrl showWindow:nil];
    [[ctrl window] makeKeyAndOrderFront:nil];
}

-(IBAction)pasteImage:(id)sender{
    NSLog(@"%@", [[[NSApplication sharedApplication].delegate images] description]);

    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    [pb clearContents];
    [pb writeObjects:[NSArray arrayWithObjects:[[[NSApplication sharedApplication].delegate images] objectForKey:[sender title]], nil]];   
}



@end
