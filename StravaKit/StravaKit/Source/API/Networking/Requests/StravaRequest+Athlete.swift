//
//  StravaRequestAthlete.swift
//  StravaKit
//
//  Created by Elmar Tampe on 10/12/14.
//
//

import Foundation

private let currentAthlete  = "athlete"
private let athletes        = "athletes"
private let friends         = "friends"
private let followers       = "followers"

extension StravaRequest {

    // ------------------------------------------------------------------------------------------
    //MARK: - Athlete URLRequests
    // ------------------------------------------------------------------------------------------
    func URLRequestForCurrentAthlete() -> NSURLRequest! {
        
        return URLRequestForResource(currentAthlete, requestMethod: .GET)
    }
    
    
    func URLRequestForAthlete(athleteID: String) -> NSURLRequest! {
        
        let resourcePath = athletes + "/" + athleteID
        return URLRequestForResource(resourcePath, requestMethod: .GET)
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Friend Requests
    // ------------------------------------------------------------------------------------------
    func URLRequestForCurrentAthleteFriends() -> NSURLRequest! {
        
        let resourcePath = currentAthlete + "/" + friends
        return URLRequestForResource(resourcePath, requestMethod: .GET)
    }
    
    
    func URLRequestForAthleteFriends(athleteID: String) -> NSURLRequest! {
        
        let resourcePath = athletes + "/" + athleteID + "/" + friends
        return URLRequestForResource(resourcePath, requestMethod: .GET)
    }
    
    
    // ------------------------------------------------------------------------------------------
    //MARK: - Follower Requests
    // ------------------------------------------------------------------------------------------
    func URLRequestForCurrentAthleteFollowers() -> NSURLRequest! {
        
        let resourcePath = currentAthlete + "/" + followers
        return URLRequestForResource(resourcePath, requestMethod: .GET)
    }
    
    
    func URLRequestForAthleteFollowers(athleteID: String) -> NSURLRequest! {
        
        let resourcePath = athletes + "/" + athleteID + "/" + followers
        return URLRequestForResource(resourcePath, requestMethod: .GET)
    }
}
