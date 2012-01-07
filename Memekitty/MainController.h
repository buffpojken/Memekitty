//
//  MainController.h
//  Memekitty
//
//  Created by Daniel Sundström on 1/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MainController : NSObject {

    IBOutlet NSMenu *statusMenu; 
    
    NSStatusItem    *statusItem; 
    NSImage         *statusImage; 

    
}

-(IBAction)helloWorld:(id)sender; 

@end
