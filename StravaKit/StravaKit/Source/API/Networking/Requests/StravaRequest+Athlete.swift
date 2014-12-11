//
//  StravaRequestAthlete.swift
//  StravaKit
//
//  Created by Elmar Tampe on 10/12/14.
//
//

import Foundation

private let resource = "athlete"

extension StravaRequest {

    // ------------------------------------------------------------------------------------------
    //MARK: - Athlete URLRequest
    // ------------------------------------------------------------------------------------------
    func URLRequestForAthlete() -> NSURLRequest! {
        
        return URLRequestForResource(resource, requestMethod: .GET)
    }
}
