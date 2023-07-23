//
//  RMService.swift
//  RickAndMorty
//
//  Created by Boris Ofon on 5/8/23.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init () {}
    
    func getRequest(requestUrl: String, completion: @escaping (Result<Data, Error>) -> Void){
        
        guard let url = URL(string: requestUrl) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = RMRequest.HttpMethods.get.rawValue.uppercased()
        
        let config = URLSessionConfiguration.default
        URLSession(configuration: config).dataTask(with: request) { data, httpResponse, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else {
                completion(.failure(CustomError(errorMessage: "Data Not Return")))
                return
            }
            
            guard let httpResponse = httpResponse as? HTTPURLResponse else {
                completion(.failure(CustomError(errorMessage: "No Http Response Code")))
                return
            }
            
            switch httpResponse.statusCode {
            case 200...208:
                completion(.success(data))
            default:
                completion(.failure(CustomError(errorMessage: "Http Statuc Code error \(httpResponse.statusCode)")))
            }
            
        }.resume()
    }
}
