//
//  ImageService.swift
//  BrowseMovieApp
//
//  Created by Nishant Gupta on 6/11/21.
//


import Foundation
import UIKit
import Networking

/// Protocol which provides method to download and cache images
protocol ImageService {
    func loadImage(url: NSURL, completion: @escaping (String, UIImage?) -> Void)
}

/// Implementation of ImageServiceProtocol
class ImageServiceImpl : ImageService {
    private var imageCache = NSCache<NSURL, UIImage>()
    
    /// Method to retrieve Image from cache only
    /// - Parameter url: URL for Image content which works as Key for cache
    /// - Returns: Returns Optional UIImage if can be retrieved and parsed successfully or nil in case of Error
    func cachedImage(url: NSURL) -> UIImage? {
        return imageCache.object(forKey: url)
    }
    
    /// Method to return Image based on URL from cache if available otherwise from Server and adds to cache as well
    /// - Parameters:
    ///   - url: URL for Image content which works as Key for cache as well
    ///   - completion: Closure to handle response of Image call containing URL string as Key and optional UIImage object  which can be nil in case of error 
    func loadImage(url: NSURL, completion: @escaping (String, UIImage?) -> Void) {
        // check in cache if present then return from cache
        if let cachedImage = cachedImage(url: url) {
            completion(url.absoluteString ?? "", cachedImage)
            return
        }
        Network.fetchData(for: url as URL) { data in
            guard let responseData = data,
                  let image = UIImage(data: responseData)
            else {
                completion(url.absoluteString ?? "", nil)
                return
            }
            self.imageCache.setObject(image, forKey: url, cost: responseData.count)
            completion(url.absoluteString ?? "", image)
        }
    }
}
