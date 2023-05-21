//
//  RMService.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 5/8/23.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init () {}
    
    func executeRequest<T: Codable>(requestUrl: RMRequest, expectingType: T.Type , completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
