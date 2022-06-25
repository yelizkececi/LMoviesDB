//
//  Movie.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 25.06.2022.
//

import Foundation

struct Movie: Codable {
    let posterPath: String
    let title: String
    let overview: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case overview
        case title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}
