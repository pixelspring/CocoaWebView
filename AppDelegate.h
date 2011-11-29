//
//  AppDelegate.h
//  CocoaWebView
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
	NSWindow *window;
	IBOutlet WebView *webView;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) IBOutlet WebView *webView;

// This method is called from JavaScript on the web page.
- (void)showMessage:(NSString *)message;

@end