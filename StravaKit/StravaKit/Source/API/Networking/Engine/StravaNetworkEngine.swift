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
    let urlSession: NSURLSession!
    
    private init() {
    
        let token = "Bearer " + StravaKitAccessToken
        
        let sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        sessionConfiguration.HTTPAdditionalHeaders = ["Authorization" : token]
        
        urlSession = NSURLSession(configuration: sessionConfiguration)
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Enqueue network request
    // ------------------------------------------------------------------------------------------
    func enqueueRequest(request: NSURLRequest?, successBlock: (NSData) -> (Void), failureBlock: () -> (Void)) {

        if let jsonRequest = request {
            
            let task: NSURLSessionDataTask =
                urlSession.dataTaskWithRequest(jsonRequest, completionHandler: {(data, response, error) in
                    
                    if let networkError = error {
                    
                        failureBlock()
                    }
                    
                    else {
                    
                        successBlock(data)
                    }
            });
            
            task.resume()
        }
            
        else {
            
            println("Request error, you should set a valid NSURLRequest object.")
        }
    }
    
    
    func sendRequest(request: NSURLRequest?) {
        
        if let aRequest = request {
            
            // TODO Wrap the response, data and error for convenient use
            let task: NSURLSessionDataTask =
                urlSession.dataTaskWithRequest(aRequest, completionHandler: {(data, response, error) in
                
                    var parseError: NSError?
                    
                    if let jsonObject: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: nil, error:&parseError) {
                        
                        if let jsonArray = jsonObject as? NSArray {
                            
                            println(jsonArray)
                        } else {
                            
                            println("Parsing Error")
                        }
                    } else {
                        
                        println("Could not parse JSON: \(error!)")
                    }
            });
            
            task.resume()
        }
        else {
            println("Request Error. TODO: Add correct error handling.")
        }
    }
}
