//
//  RMCharacter.swift
//  RickyAndMorty
//
//  Created by Banye on 1/3/24.
//

import Foundation


struct RMCharacter: Codable {
    let id: Int
    let name, species, type: String
    let status: RMStatus
    let gender: RMGender
    let origin, location: RMOrigin
    let image: String
    let episode: [String]
    let url: String
    let created: String
}


