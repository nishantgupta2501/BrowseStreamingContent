//
//  StreamService.swift
//  BrowseMovieApp
//
//  Created by Nishant Gupta on 5/11/21.
//

import Foundation
import Networking

/// Protocol which provides methods for different endpoints related to Streaming content service
protocol StreamService {
    func getStreamContent(completion: @escaping ((Result<EntertainmentContentResponse, NetworkError>) -> Void))
}

/// Implementation of StreamService Protocol
class StreamServiceImpl: StreamService {
    
    /// Method to fetch Streaming Contents from Server
    /// - Parameter completion: closure to handle response for Streaming Content API
    ///   Response can be EntertainmentContentResponse object for Success or NetworkError object for failure
    func getStreamContent(completion: @escaping ((Result<EntertainmentContentResponse, NetworkError>) -> Void)) {
        guard let streamContentsUrl = URL.streamContentsUrl() else {
            completion(.failure(.badUrl))
            return
        }
        Network.fetchJson(for: streamContentsUrl, completion: completion)
    }
}
