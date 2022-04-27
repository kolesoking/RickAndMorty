//
//  File.swift
//  RickAndMorty
//
//  Created by катя on 25.04.2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    let url = "https://rickandmortyapi.com/api/character"
    
    
    func fetchCharacters(_ url: String, completion: @escaping(Result<Character, NetworkError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let character = Character.getCharacters(from: value)
//                    print(value)
                    DispatchQueue.main.async {
                        completion(.success(character))
                    }
                case .failure:
                    completion(.failure(.decodingError))
                }
            }
    }
    
}
