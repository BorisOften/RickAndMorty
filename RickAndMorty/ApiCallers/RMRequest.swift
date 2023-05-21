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
    
    struct HttpUtility {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    private let endpoint: RMEndpoints
    
    private let pathComponents: [String]
    
    private let queryParameters: [URLQueryItem]
    
    init(endPoint: RMEndpoints, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    private var urlString: String {
            var string = HttpUtility.baseUrl
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
        public var url: URL? {
            return URL(string: urlString)
        }
}
