//
//  MovieTableViewCell.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 25.06.2022.
//

import UIKit
import ImageSlideshow

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    func configure(for vm: MoviesViewModel) {
        //yy
        let url = URL(string: vm.url)!
        if let data = try? Data(contentsOf: url) {
            movieImageView.image = UIImage(data: data)
        }
        self.titleLabel.text = vm.title
        self.descriptionLabel.text = vm.description
        self.dateLabel.text = vm.date
    }
}

