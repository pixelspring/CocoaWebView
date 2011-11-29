//
//  WebViewExampleAppDelegate.m
//  WebViewExample
//

#import "WebViewExampleAppDelegate.h"

@implementation WebViewExampleAppDelegate

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

- (void)windowWillClose:(NSNotification *)aNotification {
	[NSApp terminate:self];
}

@end