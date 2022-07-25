//
//  MovieTableViewCell.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 25.06.2022.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    //MARK: - Properties
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    //MARK: - Method Configure
    func configure(for moviesViewModel: MoviesViewModel) {
        self.movieImageView.sd_setImage(with: moviesViewModel.url, placeholderImage: UIImage(named: "image-dump-loading"))
        self.titleLabel.text = moviesViewModel.title
        self.descriptionLabel.text = moviesViewModel.description
        self.dateLabel.text = moviesViewModel.date
    }
}

