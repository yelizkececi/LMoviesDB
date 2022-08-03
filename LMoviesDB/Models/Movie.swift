//
//  Movie.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 25.06.2022.
//

import Foundation

// MARK: - Properties
struct Movie: Codable {
    let id: Int?
    let overview: String?
    let title: String?
    let imdbId: String?
    let posterPath: String?
    let releaseDate: String?
    let voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case overview
        case title
        case imdbId = "imdb_id"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
