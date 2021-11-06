//
//  Network.swift
//  Networking
//
//  Created by Nishant Gupta on 5/11/21.
//

import Foundation

public struct Network {
    private static var networkManager: NetworkManager?
    
    public static func register(_ networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    public static func deRegister() {
        self.networkManager = nil
    }
    
    public static func fetchJson<T: Codable>(for url:URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        self.networkManager?.fetchJson(for: url, completion: completion)
    }
    
    public static func fetchData(for url:URL, completion: @escaping (Data?) -> Void) {
        self.networkManager?.fetchData(for: url, completion: completion)
    }
}
