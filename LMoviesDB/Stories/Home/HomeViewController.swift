//
//  HomeViewController.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 24.06.2022.
//

import UIKit
import ImageSlideshow

class HomeViewController: UIViewController {
    //MARK: - Properties
    private var homeViewModel = HomeViewModel()
    let cellReuseIdentifier = "MovieTableViewCell"
    let headerCellReuseIdentifier = "MovieHeaderTableViewCell"

    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: headerCellReuseIdentifier, bundle: nil), forCellReuseIdentifier: headerCellReuseIdentifier)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.delegate = self
        homeViewModel.loadNowPlayingMovieData()
        homeViewModel.loadUpComingMovieData()
        self.tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ToMovieDetailViewController" {
                if let viewController = segue.destination as? MovieDetailsViewController {
                    if sender != nil {
                        let viewModel = sender as! MoviesViewModel
                        viewController.moviesViewModel = viewModel
                    }
                }
            }
        }
}

//MARK: - TableView Extensions
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! MovieTableViewCell
        self.homeViewModel.loadMoreDataIfNeeded(indexPath: indexPath)
        let movieViewModel = MoviesViewModel(self.homeViewModel.movieAtIndex(indexPath.row))
        cell.configure(for: movieViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: headerCellReuseIdentifier) as! MovieHeaderTableViewCell
        let movieViewModel = homeViewModel.sliderMovies.map {
            MovieHeaderCellViewModel(movie: $0 )
        }
        cell.configure(for: movieViewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.homeViewModel.selectedMovieDetails(indexPath: indexPath)
    }
}

//MARK: - HomeViewDelegate Extensions
extension HomeViewController: HomeViewModelDelegate {
    func didSelectMovie(_ moviesViewModel: MoviesViewModel) {
        self.performSegue(withIdentifier: "ToMovieDetailViewController", sender: moviesViewModel)
    }
    
    func dataUpdated() {
        tableView.reloadData()
    }
}
