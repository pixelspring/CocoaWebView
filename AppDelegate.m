//
//  AppDelegate.m
//  CocoaWebView
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window;
@synthesize webView;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
}

- (void)awakeFromNib {
    
	NSString *resourcesPath = [[NSBundle mainBundle] resourcePath];
	NSString *htmlPath = [resourcesPath stringByAppendingString:@"/html/index.htm"];
	[[webView mainFrame] loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:htmlPath]]];
    
    [window setDelegate:self];
	
	// Can use this to set window to coloured background: MainMenu.xib needs window appearance "textured" if so.
	//[window setBackgroundColor:[NSColor redColor]];
	
	// Configure webView to let JavaScript talk to this object.
    [[webView windowScriptObject] setValue:self forKey:@"AppDelegate"];
}

// Quit the application when window closed
- (void)windowWillClose:(NSNotification *)aNotification {
	[NSApp terminate:self];
}







+ (BOOL)isSelectorExcludedFromWebScript:(SEL)cwvSelector
{
    // For security, you should explicitly allow a selector to be called via JavaScript.
    
    if (cwvSelector == @selector(showMessage:)) {
        return NO; // showMessage: NOT excluded.
    }
    
    return YES; // disallow everything else
}



- (void)showMessage:(NSString *)message
{
    // Called via <li> in sidebar div
    NSRunAlertPanel(@"Message from JavaScript", message, nil, nil, nil);
}

@end