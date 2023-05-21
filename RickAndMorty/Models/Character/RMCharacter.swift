//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 1/22/23.
//

import Foundation

struct RMCharacter: Codable {
    let id: Int
    let name: String
    let status: RMStatus
    let species, type: String
    let gender: RMGender
    let origin, location: RMOrigin
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
