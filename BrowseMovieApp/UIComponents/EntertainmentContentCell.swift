//
//  EntertainmentContentCell.swift
//  BrowseMovieApp
//
//  Created by Nishant Gupta on 6/11/21.
//

import UIKit
import Network

class EntertainmentContentCell : UICollectionViewCell {
    static let cellID = "entertainmentContentCellId"
    weak var cellDelegate: EntertainmentContentCellDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    private let activityIndicator = UIActivityIndicatorView()
    private var currentImageUrl: String = ""
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        //contentView.clipsToBounds = true
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: EntertainmentContentCell.self),
                     bundle: Bundle(for: EntertainmentContentCell.self))
    }
    
    func reset() {
        self.imageView.image = nil
    }
    
    func bind(title: String, releaseYear: String, imageUrl: String) {
        titleLabel.text = title
        yearLabel.text = releaseYear
        currentImageUrl = imageUrl
        activityIndicator.frame = self.imageView.bounds
        self.imageView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        cellDelegate?.fetchImage(url: imageUrl) { [weak self] (url, contentImage) in
            guard let self = self,
                let image = contentImage,
                self.currentImageUrl == url
            else { return }
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.removeFromSuperview()
                self.imageView.image = image
            }
        }
    }
}
