//
//  ServiceLocator.swift
//  BrowseMovieApp
//
//  Created by Nishant Gupta on 6/11/21.
//

import Foundation

/// ServiceLocator to provide Instances of Different Services
struct ServiceLocator {
    
    /// Method to Provide StreamService Object
    /// - Returns: Object of StreamService Implementation
    static func getStreamService() -> StreamService {
        return StreamServiceImpl()
    }
    
    /// Method to Provide ImageService Object
    /// - Returns: Object of ImageService Implementation
    static func getImageService() -> ImageService {
        return ImageServiceImpl()
    }
}
