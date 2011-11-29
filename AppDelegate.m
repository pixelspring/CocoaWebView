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
}

// Quit the application when window closed
- (void)windowWillClose:(NSNotification *)aNotification {
	[NSApp terminate:self];
}

@end