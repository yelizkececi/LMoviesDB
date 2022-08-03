//
//  MovieDetailsUrlParameter.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 25.07.2022.
//

import Foundation

// MARK: - Properties
struct MovieDetailsUrlParameter: Codable {
    let apiKey: String = "317863a86401cd4592cfbe000fd43565"
    let language: String = "en"
    
    enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
        case language
    }
}
