//
//  RMAllCharacters.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 5/21/23.
//

import Foundation

struct RMAllCharacters: Codable {
    var info: Info
    var results: [RMCharacter]
}

struct Info: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}
