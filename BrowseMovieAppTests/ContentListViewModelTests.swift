//
//  ContentListViewModelTests.swift
//  BrowseMovieAppTests
//
//  Created by Nishant Gupta on 6/11/21.
//

import Foundation
@testable import BrowseMovieApp
import Networking
import XCTest


private var errorExpectation: XCTestExpectation?
private var successExpectation: XCTestExpectation?

class ContentListViewModelTests: XCTestCase {
    private let mockStreamService = MockStreamService()
    private let mockImageService = MockImageService()

    func test_series_are_filtered_correctly() {
        mockStreamService.isSuccess = true
        mockStreamService.errorType = nil
        successExpectation = XCTestExpectation(description: "Succes should call show content of delegate")
        let viewModel = ContentListViewModel(programType: .series, streamService: mockStreamService, imageService: mockImageService)
        viewModel.viewModelDelegate = self
        viewModel.loadContent()
        XCTAssertEqual(viewModel.contentList.count, 3)
        XCTAssertEqual(viewModel.contentList[0].title, "Containment")
        XCTAssertEqual(viewModel.contentList[1].title, "Roadies")
        XCTAssertEqual(viewModel.contentList[2].title, "Sherlock: The Abominable Bride")
        wait(for: [successExpectation!], timeout: 1)
    }
    
    func test_movies_are_filtered_correctly() {
        mockStreamService.isSuccess = true
        mockStreamService.errorType = nil
        successExpectation = XCTestExpectation(description: "Succes should call show content of delegate")
        let viewModel = ContentListViewModel(programType: .movie, streamService: mockStreamService, imageService: mockImageService)
        viewModel.viewModelDelegate = self
        viewModel.loadContent()
        XCTAssertEqual(viewModel.contentList.count, 2)
        XCTAssertEqual(viewModel.contentList[0].title, "Significant Mother")
        XCTAssertEqual(viewModel.contentList[1].title, "Trollied")
        wait(for: [successExpectation!], timeout: 1)
    }
    
    func testErrorScenario() {
        mockStreamService.isSuccess = false
        mockStreamService.errorType = .invalidData
        errorExpectation = XCTestExpectation(description: "loadError should be called on API failure")
        let viewModel = ContentListViewModel(programType: .movie, streamService: mockStreamService, imageService: mockImageService)
        viewModel.viewModelDelegate = self
        viewModel.viewModelDelegate = self
        viewModel.loadContent()
        wait(for: [errorExpectation!], timeout: 1)
    }
}

extension ContentListViewModelTests : ContentListViewModelDelegate {
    func showContent() {
        successExpectation?.fulfill()
    }
    
    func loadError() {
        errorExpectation?.fulfill()
    }
}
