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

/// Implementation of NetworkManager Protocol which can be registered  from Network struct
public final class NetworkManagerImplementation: NetworkManager {

   public init() {}
    
    /// Method to call rest API which returns json response
    /// - Parameter url: URL for the endpoint of API
    /// - Parameter completion: closure to handle the response of API, Result contains object of assiciated type for success or NetworkError in case of failure
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
    
    /// Method to call  API or content endpoint which returns Data type
    ///  Ex. Use this method to load images from a URL
    /// - Parameter url: URL for the endpoint
    /// - Parameter completion: closure to handle the response of API, Result contains Data in case of success and nil in case of error
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


/// Enum for different error types on Networking layer
public enum NetworkError: Error {
    case badUrl
    case invalidResponse
    case invalidData
    case decodingError
    case error(err: String)
}
