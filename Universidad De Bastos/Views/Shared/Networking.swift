//
//  Networking.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/8/21.
//

import Foundation


struct Networking {
    static let baseURL = "https://universidad-de-bastos.herokuapp.com/"
    static let mockToken = "JWT eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE1OTYzMDMwMDF9.xNOY3NJKDO-u1UG6Ulse7c0T51PtJ0fwoJWb-0B4gFE"
    
    static func setGetRequest(urlRawExtension: String) -> URLRequest{
        let getRequestURLRaw = Networking.baseURL + urlRawExtension  //"article/"
   
        let getRequestURL = URL(string: getRequestURLRaw)!
        var getRequest = URLRequest(url: getRequestURL)
        getRequest.httpMethod = "GET"
        
        getRequest.addValue(self.mockToken, forHTTPHeaderField: "Authorization")
        getRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        getRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return getRequest
    }

}
