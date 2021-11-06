//
//  ImageServiceTests.swift
//  BrowseMovieAppTests
//
//  Created by Nishant Gupta on 6/11/21.
//

import Foundation
import Networking
@testable import BrowseMovieApp
import XCTest

private let networkManager = MockNetworkManager()

class ImageServiceTests: XCTestCase {
    private let imageUrl = NSURL(string: "https://streamcoimg-a.akamaihd.net/000/963/194/963194-PosterArt-9d1f4f28bb94e5e0f06e83d1216a8e30.jpg")!
    override class func setUp() {
        Network.register(networkManager)
    }
    
    override class func tearDown() {
        Network.deRegister()
    }
    
    func test_image_service_should_call_api_only_once() {
        let imageService = ServiceLocator.getImageService()
        // First invoke will call api and add it to cache
        let expectation = expectation(description: "Image is downloaded and returned succesfully")
        imageService.loadImage(url: imageUrl) {_,_ in expectation.fulfill() }
        XCTAssertTrue(networkManager.isApiCalled)
        waitForExpectations(timeout: 1)
        // Invoking again should not call api again and return from cache
        networkManager.isApiCalled = false
        imageService.loadImage(url: imageUrl) {_,_ in }
        XCTAssertFalse(networkManager.isApiCalled)
    }
}
