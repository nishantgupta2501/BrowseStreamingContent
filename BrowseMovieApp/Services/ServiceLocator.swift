//
//  ServiceLocator.swift
//  BrowseMovieApp
//
//  Created by Nishant Gupta on 6/11/21.
//

import Foundation

class ServiceLocator {
    static func getStreamService() -> StreamService {
        return StreamServiceImpl()
    }
    
    static func getImageService() -> ImageService {
        return ImageServiceImpl()
    }
}
