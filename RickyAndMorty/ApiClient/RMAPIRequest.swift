//
//  RMAPIRequest.swift
//  RickyAndMorty
//
//  Created by Banye on 12/24/23.
//

import Foundation

protocol RMAPIRequestProtocol {

    // End Point
    var path: String { get }
    var requestType: RMRequestMethod { get }
    var headers: [String: String] { get }
    // Body
    var params: [String: Any] { get }
    //Query paramenter
    var queryItems: [String: String?] { get }
}

extension RMAPIRequestProtocol {
    
    // Base Url
    var host: String {
        //APIConstants.baseURL
        return ""
    }
    
    var headers: [String: String] {
        [:]
    }
    
    var params: [String: Any] {
        [:]
    }
    
    var queryItems: [String: String?] {
        [:]
    }
    
    func createURLRequest() throws -> URLRequest {
        var components = URLComponents()
        components.host = host
        components.path = path
        
        if !queryItems.isEmpty {
            components.queryItems = queryItems.map { URLQueryItem(name: $0, value: $1) }
        }
        
        guard let url = components.url else { throw RMNetworkError.invalidURL }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue
        
        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        
        return urlRequest
    }
}


