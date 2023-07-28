//
//  RMCharacterDetailViewModal.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 6/6/23.
//

import Foundation
import UIKit

final class RMCharacterDetailViewModel {
    
    @Published var character: RMCharacter

    var sections = [RMCharacterInfo]()
    
    init(character: RMCharacter) {
        self.character = character
        getSections()
    }
    
    func getSections() {
        
        sections = [
            RMCharacterInfo(type: .name, name: character.name),
            RMCharacterInfo(type: .status, name: character.status.rawValue),
            RMCharacterInfo(type: .species, name: character.species),
            RMCharacterInfo(type: .location, name: character.location.name),
            RMCharacterInfo(type: .gender, name: character.gender.rawValue),
            RMCharacterInfo(type: .origin, name: character.origin.name)
        ]
    }
    
}
