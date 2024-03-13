//
//  Service.swift
//  Demon Slayer
//
//  Created by Karina on 12/03/24.
//

import Foundation
import UIKit

protocol ServiceProtocol {
    func request(completion: @escaping (Result<[DataModel], NetworkError>) -> Void)
}

enum NetworkError: Error {
    case internetError
    case serverError
    case decodingError
}

class Service: ServiceProtocol {
    
    func request(completion: @escaping (Result<[DataModel], NetworkError>) -> Void) {
        guard let url = URL(string: "https://demon-slayer.cyclic.app/api/") else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            guard let data = data, error == nil else {
                completion(.failure(NetworkError.serverError))
                return
            }
            do {
                let characters = try JSONDecoder().decode([DataModel].self, from: data)
                    completion(.success(characters))
            } catch {
                print(String(describing: error))
                completion(.failure(NetworkError.decodingError))
            }
            
        }
        dataTask.resume()
    }
    
}
