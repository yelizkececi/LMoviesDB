//
//  Date.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 25.06.2022.
//

import Foundation

struct Date: Codable {
    let maximum: String
    let minimum: String
    
    enum CodingKeys: String, CodingKey {
        case maximum
        case minimum
    }
}
