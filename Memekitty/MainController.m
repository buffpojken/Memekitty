//
//  MainController.m
//  Memekitty
//
//  Created by Daniel Sundström on 1/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MainController.h"


@implementation MainController

@synthesize window, popBtn, currentImages, imgView;


- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }

    return self;
}

- (id) initWithCoder: (NSCoder *)coder
{
    if (self = [super init])
    {
        [self setProperties: [coder decodeObjectForKey:@"images"]];
    }
    return self;
}

-(void)awakeFromNib{

    [self loadDataFromDisk];
    if(self.currentImages == nil){
        self.currentImages = [[[NSMutableDictionary alloc] init] retain];    
    }
}

- (void)windowWillClose:(NSNotification *)notification{
 [self saveDataToDisk];   
}

-(IBAction)selectImage:(id)sender{
    NSMenuItem *itm = [popBtn selectedItem];
    [imgView setImage:[self.currentImages objectForKey:[itm title]]];   
}

-(IBAction)imageDropped:(id)sender{
    NSMenuItem *itm = [popBtn selectedItem];
    [self.currentImages setValue:[sender image] forKey:[itm title]];
}

-(IBAction)edit:(id)sender{
    NSWindowController *ctrl = [[NSWindowController alloc] initWithWindowNibName:@"EditWindow"];
    [ctrl showWindow:nil];
    [[ctrl window] makeKeyAndOrderFront:nil];
    [imgView setImage:[self.currentImages objectForKey:@"Picture 1"]];
}

-(IBAction)helloWorld:(id)sender{
//    NSPasteboard *pb = [NSPasteboard generalPasteboard];
//    [pb clearContents];
//    [pb writeObjects:[NSArray arrayWithObjects:[NSImage imageNamed:@"bild4.jpeg"], @"bongo.jpg", nil]];   
}

// Saving stuff...
- (void) encodeWithCoder: (NSCoder *)coder
{
    [coder encodeObject: self.currentImages forKey:@"images"];
}	

- (NSString *) pathForDataFile{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *folder = @"~/Library/Application Support/Memekitty/";
    folder = [folder stringByExpandingTildeInPath];
    
    if ([fileManager fileExistsAtPath: folder] == NO)
    {
        [fileManager createDirectoryAtPath: folder attributes: nil];
    }
    
    NSString *fileName = @"Litterbox.memekitty";
    return [folder stringByAppendingPathComponent: fileName];    
}

- (void) saveDataToDisk{
    NSString * path = [self pathForDataFile];
    
    NSMutableDictionary * rootObject;
    rootObject = [NSMutableDictionary dictionary];
    
    [rootObject setValue: [self currentImages] forKey:@"images"];
    [NSKeyedArchiver archiveRootObject: rootObject toFile: path];
}

- (void) loadDataFromDisk{
    NSString     * path        = [self pathForDataFile];
    NSDictionary * rootObject;
    
    rootObject = [NSKeyedUnarchiver unarchiveObjectWithFile:path];    
    self.currentImages = [rootObject valueForKey:@"images"];
}


@end
