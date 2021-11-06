//
//  ContentListViewModel.swift
//  BrowseMovieApp
//
//  Created by Nishant Gupta on 6/11/21.
//

import Foundation
import UIKit

protocol ContentListViewModelDelegate: AnyObject {
    func showContent()
    func loadError()
}

class ContentListViewModel {
    private let streamService: StreamService
    private let imageService: ImageService
    
    let programType: ProgramType
    weak var viewModelDelegate: ContentListViewModelDelegate?
    var contentList: [EntertainmentContent] = []
    
    init(programType: ProgramType, streamService: StreamService, imageService: ImageService) {
        self.programType = programType
        self.streamService = streamService
        self.imageService = imageService
    }
    
    func loadContent() {
        streamService.getStreamContent { [weak self] result in
            guard let self = self else { return }
            switch(result) {
            case let .success(contentResponse):
                let filteredContent = contentResponse.entries
                    .filter { $0.programType == self.programType && $0.releaseYear >= 2010 }
                                        .sorted(by: { $0.title < $1.title })
                self.contentList.append(contentsOf: filteredContent)
                DispatchQueue.main.async {
                    self.viewModelDelegate?.showContent()
                }
                
            case .failure(_):
                self.viewModelDelegate?.loadError()
            }
        }
    }
}

extension ContentListViewModel: EntertainmentContentCellDelegate {
    func fetchImage(url: String, completion: @escaping (String, UIImage?) -> Void) {
        guard let url = URL(string: url) else { return }
        imageService.loadImage(url: url as NSURL) { (url, image) in
            guard let imageData = image
            else {
                completion(url, nil)
                return
            }
            completion(url, imageData)
        }
    }
}
