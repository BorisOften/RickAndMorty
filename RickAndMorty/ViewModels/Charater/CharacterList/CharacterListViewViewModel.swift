//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 5/31/23.
//

import Foundation

class CharacterListViewViewModel {
    
    @Published var allCharacters: RMAllCharacters?
    
    func getAllCharacters() {
        let url = "\(BaseURL)\(RMEndpoints.character.rawValue)"
        NetworkManager.shared.getRequest(requestUrl: url) { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    do {
                        let allCharacters = try JSONDecoder().decode(RMAllCharacters.self, from: data)
                        self?.allCharacters = allCharacters
                        
                    } catch let error {
                        
                    }
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
    
    public var shouldShowLoadMoreIndicator: Bool  {
        if allCharacters?.info.next != nil{
            return true
        } else {
            return false
        }
    }
    
    public func fetchAdditionalCharaters() {
        guard let url = allCharacters?.info.next else {return}
        NetworkManager.shared.getRequest(requestUrl: url) { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    do {
                        let allCharacters = try JSONDecoder().decode(RMAllCharacters.self, from: data)
                        self?.allCharacters?.info = allCharacters.info
                        self?.allCharacters?.results += allCharacters.results
                        
                    } catch let error {
                        
                    }
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
}
