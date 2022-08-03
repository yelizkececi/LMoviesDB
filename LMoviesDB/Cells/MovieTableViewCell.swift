//
//  MovieTableViewCell.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 25.06.2022.
//

import UIKit
import SDWebImage
import ImageSlideshow

class MovieTableViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!

    // MARK: - Method Configure
    func configure(for moviesViewModel: MoviesViewModel) {
        self.movieImageView.sd_setImage(with: moviesViewModel.url,
                                        placeholderImage: UIImage(named: "image-dump-loading"))
        self.titleLabel.text = moviesViewModel.title
        self.descriptionLabel.text = moviesViewModel.description
        self.dateLabel.text = moviesViewModel.date
    }
}
