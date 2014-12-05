//
//  StravaClient.swift
//  StravaKit
//
//  Created by Elmar Tampe on 04/12/14.
//
//

import Foundation

@objc (MCStravaClient) public class StravaClient : NSObject {

    
    // ------------------------------------------------------------------------------------------
    //MARK: - Singleton
    // ------------------------------------------------------------------------------------------
    
    class var shared : StravaClient {
        
        struct Static {
            static let instance : StravaClient = StravaClient()
        }
        
        return Static.instance
    }
    
    // For Objective-C convenience - Use [StravaKitClient sharedInstance] as usual. use StravaClient.shared 
    // when using the framework in swift.
    
    class public func sharedInstance() -> StravaClient {
    
        return StravaClient.shared
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Login
    // ------------------------------------------------------------------------------------------
    
    
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Test
    // ------------------------------------------------------------------------------------------
    public func helloWorld() {
    
        println("Strava rockz!")
        
    }
}