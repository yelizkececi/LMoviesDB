//
//  UrlParameter.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 26.06.2022.
//

import Foundation

//MARK: - Properties
struct UrlParameter: Codable {
    let apiKey: String = "317863a86401cd4592cfbe000fd43565"
    let language: String = "en"
    let page: Int?
    
    enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
        case language
        case page
    }
}

