//
//  MockImageService.swift
//  BrowseMovieAppTests
//
//  Created by Nishant Gupta on 6/11/21.
//

import Foundation
@testable import BrowseMovieApp
import UIKit

class MockImageService: ImageService {
    func loadImage(url: NSURL, completion: @escaping (String, UIImage?) -> Void) {
        // Nothing for now
    }
}
