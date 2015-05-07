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
    func enqueueRequest(request: NSURLRequest?, successBlock: AnyObject -> Void, failureBlock: NSError? -> Void ) {

        if let jsonRequest = request {
            
            let dataTask: NSURLSessionDataTask =
                urlSession.dataTaskWithRequest(jsonRequest, completionHandler: {(data, response, error) in
                    
                    if let networkError = error {
                    
                        println("Error. Request error occured: \(error)")
                        
                        failureBlock(nil)
                    }
                    
                    else {
                        
                        var parsingError: NSError?
                        
                        if let jsonObject: AnyObject =
                                NSJSONSerialization.JSONObjectWithData(data, options: nil, error:&parsingError) {

                                    successBlock(jsonObject)
                        }
                        else {
                        
                            failureBlock(nil)
                            println("Error. JSON parsing failed with error: \(parsingError)")
                        }
                    }
            });
            
            dataTask.resume()
        }
            
        else {
            
            println("Request error, you should set a valid NSURLRequest object.")
        }
    }
}
