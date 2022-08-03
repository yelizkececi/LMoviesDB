//
//  MovieHeaderTableViewCell.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 25.06.2022.
//

import UIKit
import ImageSlideshow
import SDWebImage

class MovieHeaderTableViewCell: UITableViewCell, ImageSlideshowDelegate {
    // MARK: - Properties
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var movieDescriptionLabel: UILabel!
    @IBOutlet private weak var slideshow: ImageSlideshow!
    @IBOutlet private weak var movieView: UIView!
    var movie: [Movie]?
    
    // MARK: - Method Configure
    func configure(for movieHeaderCellViewModel: [MovieHeaderCellViewModel]) {
        movie = movieHeaderCellViewModel.map {
            $0.movie
        }
        
        let inputSources = movieHeaderCellViewModel.compactMap {
            return SDWebImageSource(url: URL(string: "\(MovieService.shared.baseImageUrl + $0.imageUrl!)")!,
                                    placeholder: UIImage(named: "image_dump_loading"))
        }
        slideshow.setImageInputs(inputSources)
        slideshow.contentScaleMode = .scaleToFill
        slideshow.delegate = self
        slideshow.activityIndicator = DefaultActivityIndicator(style: .medium, color: UIColor.black)
        if let movie = movie, !movie.isEmpty {
            movieTitleLabel.text = movie[0].title
            movieDescriptionLabel.text = movie[0].overview
        }
    }
    
    // MARK: - Method Slideshow
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        movieTitleLabel.fadeTransition(0.1)
        movieDescriptionLabel.fadeTransition(0.1)
        movieTitleLabel.text = movie?[page].title
        movieDescriptionLabel.text = movie?[page].overview
    }
}

class MovieHeaderCellViewModel {
    // MARK: - Properties
    let movie: Movie
    let imageUrl: String?
    let title: String?
    let description: String?
    
    init(movie: Movie) {
        self.movie = movie
        title = movie.title
        description = movie.overview
        imageUrl = movie.posterPath
    }
}
