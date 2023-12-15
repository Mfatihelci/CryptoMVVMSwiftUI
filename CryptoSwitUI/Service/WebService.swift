//
//  WebService.swift
//  CryptoSwitUI
//
//  Created by Muhammed fatih Elçi on 15.12.2023.
//

import Foundation

class WebService {
    
    func dowloadCurrencies(url: URL, completion: @escaping (Result<[CryptoCurrency]?,DowloaderError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badUrl))
            }
            
            guard let data = data,error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data) else {
                return completion(.failure(.dataParseError))
            }
            
            completion(.success(currencies))
        }.resume()
    }
}

enum DowloaderError: Error {
    case badUrl
    case noData
    case dataParseError
}
