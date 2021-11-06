//
//  ImageService.swift
//  BrowseMovieApp
//
//  Created by Nishant Gupta on 6/11/21.
//


import Foundation
import UIKit
import Networking

protocol ImageService {
    func loadImage(url: NSURL, completion: @escaping (String, UIImage?) -> Void)
}

class ImageServiceImpl : ImageService {
    private var imageCache = NSCache<NSURL, UIImage>()
    
    func cachedImage(url: NSURL) -> UIImage? {
        return imageCache.object(forKey: url)
    }
    
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
