//
//  MoviesViewModel.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 25.06.2022.
//

import Foundation

class MoviesViewModel {
    
    // MARK: - Properties
    var movie: Movie

    init(_ movie: Movie) {
        self.movie = movie
    }

    var url: URL? {
        if let path = self.movie.posterPath {
            return URL(string: "\(MovieService.shared.baseImageUrl + path)")
        }
        return nil
    }

    var title: String {
        return self.movie.title ?? ""
    }

    var description: String {
        return self.movie.overview ?? ""
    }

    var date: String {
        if let date = self.movie.releaseDate?.formattedDateFromString(withFormat: "dd.mm.yyyy") {
            return date
        }
         return ""
    }
    
    var rate: String {
        if let rate = self.movie.voteAverage {
            return String(format: "%.1f", rate)
        }
        return ""
    }
    
    var IMDBUrl: URL? {
        if let url = self.movie.imdbId {
            return URL(string: "\(MovieService.shared.baseIMDBUrl + url)")
        }
        return URL(string: "\(MovieService.shared.baseIMDBHomeUrl)")
    }
}
