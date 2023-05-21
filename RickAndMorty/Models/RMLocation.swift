//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 1/22/23.
//

import Foundation


struct RMLocation: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
