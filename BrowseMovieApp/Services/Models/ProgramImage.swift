//
//  ProgramImage.swift
//  BrowseMovieApp
//
//  Created by Nishant Gupta on 5/11/21.
//

import Foundation

struct ProgramImage {
    var posterArt: PosterArt
    
    enum CodingKeys: String, CodingKey {
        case posterArt = "Poster Art"
    }
}

struct PosterArt: Codable {
    var url: String
    var width: Int
    var height: Int
}

extension ProgramImage: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        posterArt = try values.decode(PosterArt.self, forKey: .posterArt)
    }
}

extension ProgramImage: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(posterArt, forKey: .posterArt)
    }
}
