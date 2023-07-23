//
//  CustomError.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 5/31/23.
//

import UIKit

class CustomError: Error {
    var errorMessage: String
    
    init(errorMessage: String){
        self.errorMessage = errorMessage
    }
}

extension CustomError: CustomStringConvertible {
    var description: String {
        return errorMessage
    }
}

extension CustomError: LocalizedError {
    var errorDescription: String? {
        return errorMessage
    }
}
