//
//  AppDelegate.m
//  CocoaWebView
//
//  Created by Mike Seaby on 1/12/2011.
//  Copyright Mike Seaby 2011. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	[webView setMainFrameURL:[self appURL]];
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag {
	[self bringMainWindowToFront:nil];
	return YES;
}

- (IBAction)bringMainWindowToFront:(id)sender {
	[window makeKeyAndOrderFront:sender];
	if ([[webView mainFrameURL] isEqualTo:@""]) {
		[webView setMainFrameURL:[self appURL]];
	}
}

- (void)windowWillClose:(NSNotification *)notification {
	[webView setMainFrameURL:@""];
}


// Should the app Quit when window closed?

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    return YES;
}

// Path to the first page to load (index.html in the "html" folder)
- (NSString *)appURL {
	return [[[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html" subdirectory:@"html"] absoluteString];
}




// Make methods available to javascript

+ (BOOL)isSelectorExcludedFromWebScript:(SEL)aSelector { return NO; }
/* + (BOOL)isSelectorExcludedFromWebScript:(SEL)cwvSelector
{
    // For security, you should explicitly allow a selector to be called via JavaScript.
    
    if (cwvSelector == @selector(showMessage:)) {
        return NO; // showMessage: NOT excluded.
    }
    
    return YES; // disallow everything else
}*/


// Delegate method triggered every page load before JavaScript run
- (void)webView:(WebView *)webView windowScriptObjectAvailable:(WebScriptObject *)windowScriptObject {
	[windowScriptObject setValue:self forKey:@"app"]; // Let class be usable through "window.app" object in JavaScript
}


// ------------------------------------------------------------------------------------------------


// Change the apps dock icon via JavaScript
- (void)changeAppIcon:(NSString *)iconName {
	[NSApp setApplicationIconImage:[NSImage imageNamed:iconName]];
}


// Show an alert panel
- (void)showPanel:(NSString *)message
{
    // Called via <li> in sidebar div
    NSRunAlertPanel(@"Message from JavaScript", message, nil, nil, nil);
}

// Play a sound file
- (void)playSound:(NSString *)soundFile isLooped:(BOOL)looping
{
	NSSound* sound = [NSSound soundNamed: soundFile];
	[sound play];
	//[sound setLoops:YES];
	NSLog(@"Sound file is: %@", soundFile);
}

// Change window title
- (void)setWindowTitle:(NSString *)windowTitle {
	NSLog(@"Window Title set to: %@", windowTitle);
	[window setTitle:windowTitle];
}



@end