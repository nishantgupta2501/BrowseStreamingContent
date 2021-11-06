//
//  EntertainmentContentCellDelegate.swift
//  BrowseMovieApp
//
//  Created by Nishant Gupta on 6/11/21.
//

import Foundation
import UIKit


protocol EntertainmentContentCellDelegate: AnyObject {
    func fetchImage(url: String, completion: @escaping (String, UIImage?) -> Void)
}
