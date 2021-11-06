//
//  NetworkManager.swift
//  Networking
//
//  Created by Nishant Gupta on 5/11/21.
//

import Foundation

public protocol NetworkManager {
    func fetchJson<T: Codable>(for url:URL, completion: @escaping (Result<T, NetworkError>) -> Void)
    func fetchData(for url:URL, completion: @escaping (Data?) -> Void)
}

public final class NetworkManagerImplementation: NetworkManager {

   public init() {}
    
   public func fetchJson<T: Codable>(for url:URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print(String(describing: error))
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
            else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            if let jsonResponse = try? JSONDecoder().decode(T.self, from: data) {
                completion(.success(jsonResponse))
            }
            else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    public func fetchData(for url: URL, completion: @escaping (Data?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print(String(describing: error))
                completion(nil)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
            else {
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            completion(data)
        }.resume()
    }
}


public enum NetworkError: Error {
    case badUrl
    case invalidResponse
    case invalidData
    case decodingError
    case error(err: String)
}
