//
//  EntertainmentContentResponse.swift
//  BrowseMovieApp
//
//  Created by Nishant Gupta on 6/11/21.
//

import Foundation

struct EntertainmentContentResponse: Codable {
    public var total: Int
    public var entries: [EntertainmentContent]
}
