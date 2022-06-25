//
//  MovieHeaderTableViewCell.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 25.06.2022.
//

import UIKit
import ImageSlideshow

class MovieHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var slideshow: ImageSlideshow!
    private var homeViewModel = HomeViewModel()

    func configure() {
        slideshow.setImageInputs(homeViewModel.getImagesUrl())
    }

}
