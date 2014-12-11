//
//  StravaNetworkEngine.swift
//  StravaKit
//
//  Created by Elmar Tampe on 10/12/14.
//
//

import Foundation


public class StravaNetworkEngine {
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Singleton
    // ------------------------------------------------------------------------------------------
    
    class var shared: StravaNetworkEngine {
        
        struct Static {
            static let instance : StravaNetworkEngine = StravaNetworkEngine()
        }
        
        return Static.instance
    }
    

    // ------------------------------------------------------------------------------------------
    //MARK: - Setup NSURLSession
    // ------------------------------------------------------------------------------------------
    let session: NSURLSession!
    
    private init() {
    
        let token = "Bearer " + StravaKitAccessToken
        
        let sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        sessionConfiguration.HTTPAdditionalHeaders = ["Authorization" : token]
        
        session = NSURLSession(configuration: sessionConfiguration)
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Send request
    // ------------------------------------------------------------------------------------------
    func sendRequest(request: NSURLRequest?) {
        
        if let aRequest = request? {
            
            // TODO Wrap the response, data and error for convenient use
            let task: NSURLSessionDataTask = session.dataTaskWithRequest(aRequest, completionHandler: {(data, response, error) in
                
                let json = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                println("\n *********************************** \n")
                println(json)
                println("\n *********************************** \n")
                
            });
            
            task.resume()
        }
        else {
        
            println("Request Error. TODO: Add correct error handling.")
        }
        

    }
}
