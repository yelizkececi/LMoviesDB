//
//  MovieService.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 25.06.2022.
//

import Foundation
import Alamofire

class MovieService {
    
    enum Route: String {
        case nowPlaying = "now_playing"
        case upComing = "upcoming"
    }
    
    //MARK: - Typealias
    typealias ErrorHandler = (_ errorMessage: String) -> Void
    
    //MARK: - Properties
    static let shared = MovieService()
    
    //MARK: - BaseURL
    let baseUrl = "https://api.themoviedb.org/3/movie/"
    
    //MARK: - ApiKey
    let apiKey = "317863a86401cd4592cfbe000fd43565"
    
    //MARK: - FilePath
    let baseImageUrl = "https://image.tmdb.org/t/p/original"
    
    //MARK: - IMDBPath
    let baseIMDBUrl = "https://www.imdb.com/title/"
    let baseIMDBHomeUrl = "https://www.imdb.com/"
    
    //MARK: - Action Now Playing - Slider
    func getNowPlaying(parameters: UrlParameter,
                       successHandler: @escaping ((MoviesResponse) -> Void),
                       errorHandler: @escaping ErrorHandler) {
        AF.request(baseUrl + Route.nowPlaying.rawValue, method: .get, parameters: parameters).responseData { response in
            print("yy Slider request = \(String(describing: response.request))")
            guard let responseData = response.data else {
                errorHandler("There was an error fetching data.")
                return
            }
            do {
                let movieResponse = try JSONDecoder().decode(MoviesResponse.self, from: responseData)
                successHandler(movieResponse)
            } catch let error {
                errorHandler("There was an error fetching data.")
                print("yeliz \(error)")
            }
        }
    }
    
    //MARK: - Action Up Coming - List
    func getUpComing(parameters: UrlParameter,
                     successHandler: @escaping ((MoviesResponse) -> Void),
                     errorHandler: @escaping ErrorHandler) {
        AF.request(baseUrl + Route.upComing.rawValue, method: .get, parameters: parameters).responseData { response in
            print("yy tableView List request = \(String(describing: response.request))")
            guard let responseData = response.data else {
                errorHandler("There was an error fetching data.")
                return
            }
            do {
                let movieResponse = try JSONDecoder().decode(MoviesResponse.self, from: responseData)
                successHandler(movieResponse)
            } catch let error {
                errorHandler("There was an error fetching data.")
                print(error)
            }
        }
    }
    
    
    //MARK: - Action Movie  Details
    func getMovieDetails(movieDetailsId: Int,
                     successHandler: @escaping ((Movie) -> Void),
                     errorHandler: @escaping ErrorHandler) {
        AF.request("\(baseUrl)\(movieDetailsId)", method: .get, parameters: MovieDetailsUrlParameter()).responseData { response in
            print("yy request = \(String(describing: response.request))")
            guard let responseData = response.data else {
                errorHandler("There was an error fetching data.")
                return
            }
            do {
                let movieResponse = try JSONDecoder().decode(Movie.self, from: responseData)
                successHandler(movieResponse)
            } catch let error {
                errorHandler("There was an error fetching data.")
                print(error)
            }
        }
    }
}
