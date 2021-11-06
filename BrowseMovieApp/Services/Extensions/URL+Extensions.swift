//
//  URL+Extensions.swift
//  BrowseMovieApp
//
//  Created by Nishant Gupta on 5/11/21.
//

import Foundation

extension URL {
    static func streamContentsUrl() -> URL? {
        return URL(string: ServiceEndpoints.streamContent.rawValue)
    }
}

enum ServiceEndpoints: String {
    case streamContent = "https://raw.githubusercontent.com/StreamCo/react-coding-challenge/master/feed/sample.json"
}
