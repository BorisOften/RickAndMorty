//
//  RMCharacterCellService.swift
//  RickyAndMorty
//
//  Created by Banye on 1/7/24.
//

import Foundation
import UIKit


protocol RMCharacterCellServiceProtocol {
    func fetchImage(imageURL: String)async throws -> UIImage
}

class RMCharacterCellService: RMCharacterCellServiceProtocol {
    
    private let requestManager = RMAPIServiceManager()
    
    func fetchImage(imageURL: String) async throws -> UIImage {
        if let url = URL(string: imageURL) {
            let urlRequest = URLRequest(url: url)
            let data = try await requestManager.request(urlRequest)
            if let image = UIImage(data: data) {
                return image
            } else { throw RMNetworkError.invalidURL }
        } else {
            throw RMNetworkError.invalidURL
        }
    }
}
