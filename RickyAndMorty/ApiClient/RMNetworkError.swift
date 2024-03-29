//
//  RMNetworkError.swift
//  RickyAndMorty
//
//  Created by Banye on 12/24/23.
//

import Foundation

public enum RMNetworkError: LocalizedError {
    
  case invalidServerResponse
  case invalidURL
    
  public var errorDescription: String? {
    switch self {
    case .invalidServerResponse:
      return "The server returned an invalid response."
    case .invalidURL:
      return "URL string is malformed."
    }
  }
}
