//
//  MemekittyAppDelegate.m
//  Memekitty
//
//  Created by Daniel Sundström on 1/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MemekittyAppDelegate.h"

@implementation MemekittyAppDelegate
@synthesize currentImages;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [self loadDataFromDisk];
    NSLog(@"ta");
    if(!self.currentImages){
        self.currentImages = [[NSMutableDictionary alloc] init];    
    }
}

- (id) initWithCoder: (NSCoder *)coder
{
    if (self = [super init])
    {
        [self setProperties: [coder decodeObjectForKey:@"images"]];
    }
    return self;
}


-(NSMutableDictionary*)images{
    return currentImages;
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
    
    [rootObject setValue: [self images] forKey:@"images"];
    [NSKeyedArchiver archiveRootObject: rootObject toFile: path];
}

- (void) loadDataFromDisk{
    NSString     * path        = [self pathForDataFile];
    NSDictionary * rootObject;
    
    rootObject = [NSKeyedUnarchiver unarchiveObjectWithFile:path];    
    self.currentImages = [rootObject valueForKey:@"images"];
}
@end
