//
//  RMCharacterViewModel.swift
//  RickyAndMorty
//
//  Created by Banye on 1/6/24.
//

import Foundation

@MainActor
final class RMCharacterViewModel {
    
    private let service: RMCharacterServiceProtocol
    
    // MARK: Research these( what happens if it is nil, will it crash)
    var allCharacters: ([RMCharacter]) -> () = {_ in }
    var error: (Error) -> () = {_ in }
    
    //MARK: Note what happens when i remove nonisolated
    nonisolated init(service: RMCharacterServiceProtocol) {
        self.service = service
    }
    
    func getAllCharacters(request: AllCharacterRequest) async {
        do {
          let characters = try await service.getAllCharacters(request: request)
            allCharacters(characters.results)
        } catch let error {
            self.error(error)
        }
    }
    
}
