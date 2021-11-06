//
//  MoviesViewController.swift
//  BrowseMovieApp
//
//  Created by Nishant Gupta on 5/11/21.
//

import UIKit

class ContentListViewController: UIViewController {

    private var contentCollectionView: UICollectionView?
    var viewModel: ContentListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewModelDelegate = self
        viewModel?.loadContent()
        title = viewModel?.programType.rawValue
    }
}

extension ContentListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.contentList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = contentCollectionView?.dequeueReusableCell(withReuseIdentifier: EntertainmentContentCell.cellID, for: indexPath) as? EntertainmentContentCell else { fatalError() }
        cell.reset()
        if let content = viewModel?.contentList[indexPath.row] {
            cell.cellDelegate = viewModel
            cell.bind(title: content.title, releaseYear: String(content.releaseYear), imageUrl: content.images.posterArt.url)
        }
        return cell
    }
}


extension ContentListViewController: ContentListViewModelDelegate {
    func showContent() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.width/3 - 16), height: (view.frame.size.height/4)-2)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 0
        contentCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let contentCollectionView = contentCollectionView else { return }
        contentCollectionView.register(EntertainmentContentCell.nib(), forCellWithReuseIdentifier: EntertainmentContentCell.cellID)
        contentCollectionView.delegate = self
        contentCollectionView.dataSource = self
        view.addSubview(contentCollectionView)
        contentCollectionView.frame = CGRect(x: 8, y: 8, width: view.bounds.width-16, height: view.bounds.height-16)
    }
    
    func loadError() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Something went wrong", message: "Sorry, we're facing technical difficulty at the moment, please try again letter  ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
}
