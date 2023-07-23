//
//  RMEndpoints.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 5/8/23.
//

import Foundation

var BaseURL: String {
    return "https://rickandmortyapi.com/api/"
}



@frozen enum RMEndpoints: String {
    case location
    case character
    case episode
}
