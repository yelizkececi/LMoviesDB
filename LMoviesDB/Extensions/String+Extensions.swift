//
//  String+Extensions.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 25.07.2022.
//

import Foundation

extension String {
    //MARK: - Date Formatter
    func formattedDateFromString(withFormat format: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-mm-dd"
        if let date = inputFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = format
            return outputFormatter.string(from: date)
        }
        return nil
    }
}
