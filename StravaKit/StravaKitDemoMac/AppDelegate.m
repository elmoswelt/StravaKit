//
//  AppDelegate.m
//  StravaKitDemoMac
//
//  Created by Elmar Tampe on 03/12/14.
//
//

#import "AppDelegate.h"
#import <StravaKitOSX/StravaKitOSX-Swift.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    StravaKitClient *api = [[StravaKitClient alloc] init];
    
    [api helloWorld];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
