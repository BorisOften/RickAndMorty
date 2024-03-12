//
//  RMCharacterService.swift
//  RickyAndMorty
//
//  Created by Banye on 1/6/24.
//

import Foundation

protocol RMCharacterServiceProtocol {
    func getAllCharacters(request: AllCharacterRequest) async throws -> RMAllCharacters
    func getMoreCharacters(request: URLRequest) async throws -> RMAllCharacters
}

class RMCharacterService: RMCharacterServiceProtocol {
    
    private let requestManager =  RMAPIServiceManager()
    
    // TODO: Create a Generic for decoding the data
    func getAllCharacters(request: AllCharacterRequest) async throws -> RMAllCharacters {
        let data = try await requestManager.request(request)
        let allCharacters = try JSONDecoder().decode(RMAllCharacters.self, from: data)
        return allCharacters
    }
    
    func getMoreCharacters(request: URLRequest) async throws -> RMAllCharacters {
        let data = try await requestManager.request(request)
        let allCharacters = try JSONDecoder().decode(RMAllCharacters.self, from: data)
        return allCharacters
    }
}
