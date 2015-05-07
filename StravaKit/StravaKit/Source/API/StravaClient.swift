//
//  StravaClient.swift
//  StravaKit
//
//  Created by Elmar Tampe on 04/12/14.
//
//

import Foundation


@objc (MCStravaClient) public class StravaClient : NSObject {

    // Shared Network Engine
    let sharedNetworkEngine = StravaNetworkEngine.shared
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Singleton
    // ------------------------------------------------------------------------------------------
    
    class var shared : StravaClient {
        
        struct Static {
            
            static let instance : StravaClient = StravaClient()
        }
                
        return Static.instance
    }
    
    // For Objective-C convenience - Use '[StravaKitClient sharedInstance]' as usual. Use 'StravaClient.shared'
    // when using the framework in swift.
    
    class public func sharedInstance() -> StravaClient {
    
        return StravaClient.shared
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Login
    // ------------------------------------------------------------------------------------------
    public func login() -> Bool {
        
        println("Login should be done here.")
        return true
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Fetch User/Athletes
    // ------------------------------------------------------------------------------------------
    public func fetchCurrentAthlete(successBlock: StravaAthlete -> Void) {
    
        println("Fetch Me as an athlete.")
        
        let request = StravaRequest().URLRequestForCurrentAthlete()
        
        sharedNetworkEngine.enqueueRequest(request,
            successBlock: { (jsonData: AnyObject) -> Void in
            
                if let jsonDict = jsonData as? NSDictionary {
                
                    if let athlete = StravaAthlete.stravaAthleteWithJSONDict(jsonDict) {
                    
                        successBlock(athlete)
                    }
                }
            },
            failureBlock: { (error: NSError?) -> Void in
                
                println("Error fetching Me as an athlete.")
        });
    }
}
