//
//  EntertainmentContent.swift
//  BrowseMovieApp
//
//  Created by Nishant Gupta on 5/11/21.
//

import Foundation

struct EntertainmentContent: Codable {
    var title: String
    var description: String
    var programType: ProgramType
    var images: ProgramImage
    var releaseYear: Int
}
