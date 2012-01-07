//
//  MenuController.h
//  Memekitty
//
//  Created by Daniel Sundström on 2012-01-07.
//  Copyright (c) 2012 Qubator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuController : NSObject{
    
    IBOutlet NSMenu *statusMenu; 
    NSStatusItem    *statusItem; 
    NSImage         *statusImage; 
    
}


@property (strong) NSStatusItem *statusItem;


@end

