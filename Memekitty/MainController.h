//
//  MainController.h
//  Memekitty
//
//  Created by Daniel Sundström on 1/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEditableImageView.h"

@interface MainController : NSObject <NSCoding> {

    IBOutlet NSPopUpButton *popBtn;
    IBOutlet NSImageView *imgView;
    NSWindow *window;
    NSMutableDictionary *currentImages; 

    
}
@property (strong) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSPopUpButton *popBtn;
@property (strong) IBOutlet NSImageView *imgView;
@property (retain) NSMutableDictionary *currentImages; 

-(IBAction)helloWorld:(id)sender; 
-(IBAction)selectImage:(id)sender;
-(IBAction)imageDropped:(id)sender;
-(IBAction)edit:(id)sender;
- (NSString *) pathForDataFile;
- (void) saveDataToDisk;
- (void) loadDataFromDisk;


@end
