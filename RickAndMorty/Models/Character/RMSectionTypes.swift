//
//  RMSectionTypes.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 7/9/23.
//

import Foundation
import UIKit

struct RMCharacterInfo {
    var type: RMSectionTypes
    var name: String
    
    var color: UIColor {
        switch self.type {
            
        case .name:
            return .blue
        case .status:
            return .orange
        case .species:
            return .purple
        case .gender:
            return .green
        case .origin:
            return .gray
        case .location:
            return .brown
        case .type:
            return .magenta
        }
    }
}

enum RMSectionTypes: String, CaseIterable {
    case name
    case status
    case species
    case gender
    case origin
    case location
    case type
}
