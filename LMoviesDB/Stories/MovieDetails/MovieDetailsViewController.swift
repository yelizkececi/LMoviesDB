//
//  MovieDetailsViewController.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 25.06.2022.
//

import UIKit
import Alamofire
import SafariServices
import SDWebImage

class MovieDetailsViewController: UIViewController, SFSafariViewControllerDelegate {
    //MARK: - Properties
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieDateLabel: UILabel!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var movieIMDBButton: UIButton!
    @IBOutlet weak var movieRateLabel: UILabel!
    
    var moviesViewModel: MoviesViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewModel = moviesViewModel else { return }
        self.title =  viewModel.title
        movieImageView.sd_setImage(with: viewModel.url, placeholderImage: UIImage(named: "image-dump-loading"))
        movieDateLabel.text = viewModel.date
        movieTitleLabel.text = viewModel.title
        movieDescriptionLabel.text = viewModel.description
        movieRateLabel.text = viewModel.rate
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.backItem?.title = ""
    }
    
    //MARK: - IMDB Button Tapped
    @IBAction func onIMDBButtonTap(_ sender: Any) {
        guard let viewModel = moviesViewModel else { return }
        if let url = viewModel.IMDBUrl {
            let safariViewController = SFSafariViewController(url: url)
            safariViewController.delegate = self
            present(safariViewController, animated: true)
        }
    }
}
