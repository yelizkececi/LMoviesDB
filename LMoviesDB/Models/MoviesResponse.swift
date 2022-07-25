//
//  MoviesResponse.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 25.06.2022.
//

import Foundation

//MARK: - Properties
struct MoviesResponse: Codable {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [Movie]

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
