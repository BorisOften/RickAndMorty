//
//  AllCharacterRequest.swift
//  RickyAndMorty
//
//  Created by Banye on 1/6/24.
//

import Foundation

enum AllCharacterRequest: RMAPIRequestProtocol {
    case allCharacter
    
    var path: String {
        return "/api/character/"
    }
    
    var requestType: RMRequestMethod {
        .GET
    }
}
