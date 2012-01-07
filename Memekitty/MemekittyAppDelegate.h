//
//  MemekittyAppDelegate.h
//  Memekitty
//
//  Created by Daniel Sundström on 1/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MemekittyAppDelegate : NSObject <NSApplicationDelegate, NSCoding> {

    NSMutableDictionary *currentImages; 

@private
}
@property (retain, readwrite) NSMutableDictionary *currentImages; 

- (NSString *) pathForDataFile;
- (void) saveDataToDisk;
- (void) loadDataFromDisk;
- (NSMutableDictionary*)images;


@end
