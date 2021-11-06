//
//  StreamService.swift
//  BrowseMovieApp
//
//  Created by Nishant Gupta on 5/11/21.
//

import Foundation
import Networking

protocol StreamService {
    func getStreamContent(completion: @escaping ((Result<EntertainmentContentResponse, NetworkError>) -> Void))
}

class StreamServiceImpl: StreamService {
    func getStreamContent(completion: @escaping ((Result<EntertainmentContentResponse, NetworkError>) -> Void)) {
        guard let streamContentsUrl = URL.streamContentsUrl() else {
            completion(.failure(.badUrl))
            return
        }
        Network.fetchJson(for: streamContentsUrl, completion: completion)
    }
}
