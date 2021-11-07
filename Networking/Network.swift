//
//  Network.swift
//  Networking
//
//  Created by Nishant Gupta on 5/11/21.
//

import Foundation

/// Struct providing facade for Networking layer
public struct Network {
    private static var networkManager: NetworkManager?
    
    /// Method to Register Manager for Networking layer which is used for API calls
    /// - Parameter networkManager: parameter which confirms to NetworkManager Protocol
    public static func register(_ networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    /// Use this method to Deregister implementation of NetworkManager Protocol
    public static func deRegister() {
        self.networkManager = nil
    }
    
    /// Method to call rest API which returns json response
    /// - Parameter url: URL for the endpoint of API
    /// - Parameter completion: closure to handle the response of API, Result contains object of assiciated type for success or NetworkError in case of failure
    public static func fetchJson<T: Codable>(for url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        self.networkManager?.fetchJson(for: url, completion: completion)
    }
    
    /// Method to call  API or content endpoint which returns Data type
    ///  Ex. Use this method to load images from a URL
    /// - Parameter url: URL for the endpoint
    /// - Parameter completion: closure to handle the response of API, Result contains Data in case of success and nil in case of error 
    public static func fetchData(for url:URL, completion: @escaping (Data?) -> Void) {
        self.networkManager?.fetchData(for: url, completion: completion)
    }
}
