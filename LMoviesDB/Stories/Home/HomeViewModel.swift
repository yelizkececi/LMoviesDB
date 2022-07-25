//
//  HomeViewModel.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 25.06.2022.
//

import Foundation
import ImageSlideshow

protocol HomeViewModelDelegate: AnyObject {
    func dataUpdated()
    func didSelectMovie(_ movieViewModel: MoviesViewModel)
}

class HomeViewModel {
    //MARK: - Properties
    var movies: [Movie] = []
    var sliderMovies: [Movie] = []
    var movie: Movie?
    var currentPage: Int = 1
    var maxPage: Int = 0
    
    weak var delegate: HomeViewModelDelegate?
     
    //MARK: - Method TableView NumberOfRowsInSection
    func numberOfRowsInSection() -> Int {
        return movies.count
    }

    //MARK: - Method TableView MovieAtIndex
    func movieAtIndex(_ index: Int) -> Movie {
        return movies[index]
    }
    
    //MARK: - Method Request loadUpComingMovieData
    func loadUpComingMovieData() {
        MovieService.shared.getUpComing(page: 1, completion: { result in
            switch result {
            case .responseSuccess(let response):
                self.movies.append(contentsOf: response.results)
                self.maxPage = response.totalPages
                self.delegate?.dataUpdated()
            case .responseFail(let error):
                print(error)
            }
        })
    }
    
    func loadNowPlayingMovieData() {
        MovieService.shared.getNowPlaying(page: 1, completion: { result in
            switch result {
            case .responseSuccess(let response):
                self.sliderMovies = response.results
                self.delegate?.dataUpdated()
            case .responseFail(let error):
                print(error)
            }
        })
    }
    
    //MARK: - Method Request loadMoreDataIfNeeded
    func loadMoreDataIfNeeded(indexPath: IndexPath) {
        if ((indexPath.row == numberOfRowsInSection() - 1) &&  currentPage <= maxPage){
            currentPage += 1
            loadUpComingMovieData()
        }
    }
    
    //MARK: - Method Movie selectedMovieDetails
    func selectedMovieDetails(indexPath: IndexPath) {
        guard let movieDetailsId = movies[indexPath.row].id else { return }
        MovieService.shared.getMovieDetails(with: String(movieDetailsId), completion: { result in
            print("yy \(result)")
            switch result {
               
            case .responseSuccess(let response):
                print("yy \(response)")
                let moviesViewModel = MoviesViewModel(response)
                self.delegate?.didSelectMovie(moviesViewModel)
            case .responseFail(let error):
                print(error)
            }
        })
    }
}


