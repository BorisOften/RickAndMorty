//
//  RMCharacterCellViewModel.swift
//  RickyAndMorty
//
//  Created by Banye on 1/7/24.
//

import Foundation
import UIKit

@MainActor
final class RMCharacterCellViewModel {
    
    private var service: RMCharacterCellServiceProtocol
    
    var avatarImage: (UIImage) -> () = {_ in}
    var error: (Error) -> () = {_ in}
    
    nonisolated init(service: RMCharacterCellServiceProtocol = RMCharacterCellService()) {
        self.service = service
    }
    
    
    func fetchImage(imageURL: String) async {
        do {
            let image =  try await service.fetchImage(imageURL: imageURL)
            self.avatarImage(image)
        } catch let error {
            self.error(error)
        }
    }
    
    
}
