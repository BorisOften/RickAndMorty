//
//  RMCharacterDetailViewModal.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 6/6/23.
//

import Foundation
import UIKit

final class RMCharacterDetailViewModel {
    
    @Published var character: RMCharacter?
    @Published var error: String?
    
    var sections = RMSectionTypes.allCases
    
//    init(character: RMCharacter?) {
//        self.character = character
//    }
    
    func getCharterDetailInfo(characterId: Int) {
        let id = String(characterId)
        let url = "\(BaseURL)\(RMEndpoints.character.rawValue)\(id)/"
        
        NetworkManager.shared.getRequest(requestUrl: url) { result in
            
            switch result {
            case .success(let data):
                do {
                    let character =  try JSONDecoder().decode(RMCharacter.self, from: data)
                    self.character = character
                } catch let error {
                    self.error = error.localizedDescription
                }
            case .failure(let error):
                self.error = error.localizedDescription
            }
        }
        
    }
}
