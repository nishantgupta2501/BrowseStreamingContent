//
//  ViewController.swift
//  BrowseMovieApp
//
//  Created by Nishant Gupta on 5/11/21.
//

import UIKit


class HomeViewController: UIViewController {
    private var mainStoryBoard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle(for: HomeViewController.self))
    }
    
    private let imageService = ServiceLocator.getImageService()
    private let streamService = ServiceLocator.getStreamService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapBrowseMoviesBtn(_ sender: Any) {
        navigateToContentListScreen(programType: .movie)
    }
    
    @IBAction func didTapBrowseSeriesBtn(_ sender: Any) {
        navigateToContentListScreen(programType: .series)
    }
    
    private func navigateToContentListScreen(programType: ProgramType) {
        guard let contentListViewController = mainStoryBoard.instantiateViewController(withIdentifier: "contentList") as? ContentListViewController
        else { return }
        contentListViewController.viewModel = ContentListViewModel(programType: programType, streamService: streamService, imageService: imageService)
        navigationController?.pushViewController(contentListViewController, animated: true)
    }
}

