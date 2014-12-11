//
//  StravaRequest.swift
//  StravaKit
//
//  Created by Elmar Tampe on 10/12/14.
//
//

import Foundation

// -----------------------------------------------------------------------------------------------

private let baseURL = "https://www.strava.com/api/v3/"

enum HTTPMethod : NSString {
    case GET    = "GET"
    case POST   = "POST"
    case PUT    = "PUT"
    case DELETE = "DELETE"
}

// ----------------------------------------------------------------------------------------------

class StravaRequest {

    // ------------------------------------------------------------------------------------------
    //MARK: - URL Request
    // ------------------------------------------------------------------------------------------
    func URLRequestForResource(ressource: String!, requestMethod: HTTPMethod!) -> NSURLRequest? {
        
        if let ressource = ressource? {
        
            let urlString = baseURL + ressource
            let url = NSURL(string: urlString)
            let request = NSMutableURLRequest(URL: url!)
            
            if let HTTPMethod =  requestMethod?.rawValue {
                
                request.HTTPMethod = HTTPMethod
            }
            
            return request
        }
        
        return nil
    }
}
