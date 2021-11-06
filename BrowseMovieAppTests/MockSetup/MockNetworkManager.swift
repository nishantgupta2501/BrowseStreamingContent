//
//  MockNetworkProviderImplementation.swift
//  BrowseMovieAppTests
//
//  Created by Nishant Gupta on 6/11/21.
//

import Foundation
import Networking
import UIKit

class MockNetworkManager: NetworkManager {
    var isSuccess: Bool = true
    var errorType: NetworkError?
    var isApiCalled: Bool = false
    
    func fetchJson<T>(for url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable, T : Encodable {
        
    }
    
    func fetchData(for url: URL, completion: @escaping (Data?) -> Void) {
        isApiCalled = true
        let size = CGSize(width: 1, height: 1)
        let image = UIGraphicsImageRenderer(size: size).image { rendererContext in
            UIColor.yellow.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
        completion(image.pngData())
    }
}
