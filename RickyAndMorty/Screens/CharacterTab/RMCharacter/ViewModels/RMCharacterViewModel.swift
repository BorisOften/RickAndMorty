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
    
    var nextURLForMoreCharacters: String? = nil
    var isFetchingMoreCharacters = false
    
    // MARK: Research these( what happens if it is nil, will it crash?)
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
            self.nextURLForMoreCharacters = characters.info.next
        } catch let error {
            self.error(error)
        }
    }
    
    func fetchMoreCharacters() async {
        guard let nextURL = self.nextURLForMoreCharacters, let url = URL(string: nextURL) else { return }
        
        self.isFetchingMoreCharacters = true
        do {
            let request = URLRequest(url: url)
            let characters = try await service.getMoreCharacters(request: request)
            allCharacters(characters.results)
            self.nextURLForMoreCharacters = characters.info.next
        } catch let error {
            self.error(error)
        }
        self.isFetchingMoreCharacters = false
    }
    
}
