//
//  APIEndpoint.swift
//  20230323-RobertCovuNYCSchools
//
//  Created by Robert Covu on 3/22/23.
//

import Foundation

enum APIEndpoint {
    case SchoolList
    
    var url: URL? {
        switch self {
        case .SchoolList:
            guard let url = URLComponents(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json") else { return nil }
            
            return url.url

        }
    }
    
}
