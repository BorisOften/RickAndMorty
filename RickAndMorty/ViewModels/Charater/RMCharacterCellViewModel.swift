//
//  RMCharacterCellViewModel.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 6/3/23.
//

import Foundation


struct RMCharacterCellViewModel {
    let characterName: String
    let characterStatus: RMStatus
    let CharacterImageUrl: URL?
    
    var imageDataCache = NSCache<NSString, NSData>()
    
    public func fetchImage(completion: @escaping (Result<Data, Error>)-> Void) {
        guard let url = CharacterImageUrl?.absoluteString else {
            completion(.failure(CustomError(errorMessage: "The request URL was inValid")))
            return
        }
        
        
        let key = url as NSString
        if let data = imageDataCache.object(forKey: key) {
            completion(.success(data as Data))
            return
        }
        
        NetworkManager.shared.getRequest(requestUrl: url) {  result in
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(let data):
                    
                    self.imageDataCache.setObject(data as NSData, forKey: key)
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
