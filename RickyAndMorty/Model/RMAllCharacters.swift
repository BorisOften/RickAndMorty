//
//  RMAllCharacters.swift
//  RickyAndMorty
//
//  Created by Banye on 1/6/24.
//

import Foundation

struct RMAllCharacters: Codable {
    let info: Info
    let results: [RMCharacter]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}
