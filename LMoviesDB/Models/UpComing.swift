//
//  UpComing.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 25.06.2022.
//

import Foundation

struct UpComing: Codable {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [Movie]
    let dates: [Date]

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case dates
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
