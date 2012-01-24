//
//  MainController.m
//  Memekitty
//
//  Created by Daniel Sundström on 1/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MainController.h"
#import "MemekittyAppDelegate.h"
#import "JSONKit.h"

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
    
    [self uploadToImgur:[sender image]];
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
    [pb writeObjects:[NSArray arrayWithObjects:
                      [[[[NSApplication sharedApplication].delegate images]objectForKey:[sender title]] name], 

                      [[[NSApplication sharedApplication].delegate images]objectForKey:[sender title]], 
                      
                      nil]];   
}

- (void) uploadToImgur: (NSImage *) image
{
    NSURL *url = [NSURL URLWithString:@"http://api.imgur.com/2/upload.json?key=ddb8bf0b86f4f46a3063d65d631a8dca"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSString *b64 = [[image TIFFRepresentation] base64EncodedString];
    [request setHTTPBody:[b64 dataUsingEncoding:NSUTF8StringEncoding]];
    
    [NSURLConnection sendAsynchronousRequest:request 
                                       queue:[NSOperationQueue currentQueue] 
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               NSString *returned = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                               JKDictionary *responseData = [[[data objectFromJSONData] upload] links];
                               NSLog(@"%@", [responseData imgur_page]);
                               [image setName:[responseData imgur_page]];
                               [returned release];             
                           }];
}



@end
