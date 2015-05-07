//
//  AppDelegate.m
//  StravaKitDemoMac
//
//  Created by Elmar Tampe on 03/12/14.
//
//

#import "AppDelegate.h"
#import <StravaKitOSX/StravaKitOSX-Swift.h>


@implementation AppDelegate


// ------------------------------------------------------------------------------------------
#pragma mark - Application Lifecycle
// ------------------------------------------------------------------------------------------
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    // Insert code here to initialize your application
    
    [self runTestCalls];
}



- (void)applicationWillTerminate:(NSNotification *)aNotification {
    
    // Insert code here to tear down your application
}


// ------------------------------------------------------------------------------------------
#pragma mark - Test Calls
// ------------------------------------------------------------------------------------------
- (void)runTestCalls {

    [[StravaClient sharedInstance] login];
    
    [[StravaClient sharedInstance] fetchMe:^(StravaAthlete *athlete) {
        
        NSLog(@"Fetching ME. Athlete: %@", athlete);
    }];
}


@end
