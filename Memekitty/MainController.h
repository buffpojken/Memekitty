//
//  MainController.h
//  Memekitty
//
//  Created by Daniel Sundström on 1/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBEditableImageView.h"

@interface MainController : NSObject {

    IBOutlet NSPopUpButton *popBtn;
    IBOutlet NSImageView *imgView;

    
}
@property (strong) IBOutlet NSPopUpButton *popBtn;
@property (strong) IBOutlet NSImageView *imgView;

-(IBAction)pasteImage:(id)sender; 
-(IBAction)selectImage:(id)sender;
-(IBAction)imageDropped:(id)sender;
-(IBAction)edit:(id)sender;


@end
