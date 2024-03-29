//
//  RMLocation.swift
//  RickyAndMorty
//
//  Created by Banye on 1/3/24.
//

import Foundation


struct RMLocation: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
