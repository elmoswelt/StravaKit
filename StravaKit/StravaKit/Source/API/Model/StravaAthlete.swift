//
//  StravaAthlete.swift
//  StravaKit
//
//  Created by Elmar Tampe on 04/12/14.
//
//

import Foundation

@objc (MCStravaAthlete) public class StravaAthlete : NSObject {

    
    public var name: NSString?
    public var lastName: NSString?

    
    // ------------------------------------------------------------------------------------------
    //MARK: - Initializer
    // ------------------------------------------------------------------------------------------
    init(jsonDict: NSDictionary) {
        
        super.init()
        map(jsonDict)
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Convinience Initializer
    // ------------------------------------------------------------------------------------------
    class func stravaAthleteWithJSONDict(jsonDict: NSDictionary) -> StravaAthlete? {
        
        return StravaAthlete(jsonDict: jsonDict)
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - JSON Mapping
    // ------------------------------------------------------------------------------------------
    private func map(jsonDict: NSDictionary) {
    
        println(jsonDict)
        
        if let name = jsonDict["firstname"] as? NSString {
        
            self.name = name;
        }
        
        if let lastName = jsonDict["firstname"] as? NSString {
            
            self.lastName = lastName;
        }
    }
}
