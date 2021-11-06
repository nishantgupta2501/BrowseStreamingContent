//
//  MockNetworkProvider.swift
//  BrowseMovieAppTests
//
//  Created by Nishant Gupta on 6/11/21.
//

import Foundation
import Networking
@testable import BrowseMovieApp

class MockStreamService: StreamService {
    var isSuccess: Bool = true
    var errorType: NetworkError?
    
   func getStreamContent(completion: @escaping ((Result<EntertainmentContentResponse, NetworkError>) -> Void)) {
        guard isSuccess
        else {
            completion(.failure( errorType ?? .invalidData))
            return
        }
        completion(.success(EntertainmentContentResponse(
            total: 5, entries: [
                        EntertainmentContent(title: "iZombie",
                                            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                             programType: .series,
                                             images: ProgramImage(posterArt: PosterArt(
                                                url: "https://streamcoimg-a.akamaihd.net/000/197/7/1977-PosterArt-a2d3a9bb0ba1e05d26b29aed143715ce.jpg",
                                                width: 200,
                                                height: 300)),
                                             releaseYear: 2009),
                        EntertainmentContent(title: "Roadies",
                                            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                             programType: .series,
                                             images: ProgramImage(posterArt: PosterArt(
                                                url: "https://streamcoimg-a.akamaihd.net/000/132/42/13242-PosterArt-dfd9c3a0fa5db6e2e38b62e7fedcaf47.jpg",
                                                width: 200,
                                                height: 300)),
                                             releaseYear: 2016),
                        EntertainmentContent(title: "Sherlock: The Abominable Bride",
                                            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                             programType: .series,
                                             images: ProgramImage(posterArt: PosterArt(
                                                url: "https://streamcoimg-a.akamaihd.net/000/115/93/11593-PosterArt-33274b61ab0cb0e19cb7bff35824efb9.jpg",
                                                width: 200,
                                                height: 300)),
                                             releaseYear: 2016),
                        EntertainmentContent(title: "Containment",
                                            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                             programType: .series,
                                             images: ProgramImage(posterArt: PosterArt(
                                                url: "https://streamcoimg-a.akamaihd.net/000/129/01/12901-PosterArt-b18cb05ecda13ea274c4e32a2d6ea427.jpg",
                                                width: 200,
                                                height: 300)),
                                             releaseYear: 2014),
                        EntertainmentContent(title: "U2: Live in Paris",
                                            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                             programType: .movie,
                                             images: ProgramImage(posterArt: PosterArt(
                                                url: "https://streamcoimg-a.akamaihd.net/000/963/194/963194-PosterArt-9d1f4f28bb94e5e0f06e83d1216a8e30.jpg",
                                                width: 200,
                                                height: 300)),
                                             releaseYear: 2009),
                        EntertainmentContent(title: "Trollied",
                                            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                             programType: .movie,
                                             images: ProgramImage(posterArt: PosterArt(
                                                url: "https://streamcoimg-a.akamaihd.net/000/173/2/1732-PosterArt-85cc2547b4aca4a5dd38e332f602a3c3.jpg",
                                                width: 200,
                                                height: 300)),
                                             releaseYear: 2015),
                        EntertainmentContent(title: "Significant Mother",
                                            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                             programType: .movie,
                                             images: ProgramImage(posterArt: PosterArt(
                                                url: "https://streamcoimg-a.akamaihd.net/000/173/2/1732-PosterArt-85cc2547b4aca4a5dd38e332f602a3c3.jpg",
                                                width: 200,
                                                height: 300)),
                                             releaseYear: 2010)]
                    )))
    }
}
