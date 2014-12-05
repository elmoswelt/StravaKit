//
//  StravaKitClient.swift
//  StravaKit
//
//  Created by Elmar Tampe on 04/12/14.
//
//

import Foundation

@objc (MCStravaKitClient) public class StravaKitClient : NSObject {

    
    // ------------------------------------------------------------------------------------------
    //MARK: - Singleton
    // ------------------------------------------------------------------------------------------
    
    class var shared : StravaKitClient {
        
        struct Static {
            static let instance : StravaKitClient = StravaKitClient()
        }
        
        return Static.instance
    }
    
    // For Objective-C convenience - Use [StravaKitClient sharedInstance] as usual. use StravaClient.shared 
    // when using the framework in swift.
    
    class public func sharedInstance() -> StravaKitClient {
    
        return StravaKitClient.shared
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Test
    // ------------------------------------------------------------------------------------------
    public func helloWorld() {
    
        println("Strava rockz!")
        
    }
}