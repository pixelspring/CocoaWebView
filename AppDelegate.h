//
//  AppDelegate.h
//  CocoaWebView
//
//  Created by Mike Seaby on 1/12/2011.
//  Copyright Mike Seaby 2011. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
	IBOutlet id webView;
	IBOutlet NSWindow *window;
}

- (IBAction)bringMainWindowToFront:(id)sender;
- (NSString *)appURL;

// Called via js
- (void)changeAppIcon:(NSString *)iconName;
- (void)showPanel:(NSString *)message;

- (IBAction)playSound:(NSString *)soundFile;

@end
