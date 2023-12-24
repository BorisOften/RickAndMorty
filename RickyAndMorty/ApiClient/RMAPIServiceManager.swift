//
//  RMAPIServiceManager.swift
//  RickyAndMorty
//
//  Created by Banye on 12/24/23.
//

import Foundation

final class RMAPIServiceManager {
    
    let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func request(_ request: RMAPIRequestProtocol) async throws -> Data {
        let (data, response) = try await urlSession.data(for: request.createURLRequest())
        
        guard let httpResponse = response as? HTTPURLResponse else { throw RMNetworkError.invalidServerResponse }
        
        switch httpResponse.statusCode {
        case 200...209:
            return data
        default:
            throw RMNetworkError.invalidServerResponse
        }
    }
}
