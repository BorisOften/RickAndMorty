//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 5/8/23.
//

import Foundation

class RMRequest {
    
    // base url
    // endpoints
    // path components
    // query parameters (optional)
    
    private let endpoint: RMEndpoints
    
    private let pathComponents: [String]
    
    private let queryParameters: [URLQueryItem]
    
    init(endPoint: RMEndpoints, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    
    enum HttpMethods: String {
        case get, post, patch, delete
    }
    
    // MARK: Make request url String
    private var urlString: String {
        var string = BaseURL
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    /// Computed & constructed API url
    private var url: URL? {
        return URL(string: urlString)
    }
    
    // MARK: Get Request
    static func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        return request
    }
}
