//
//  MovieService.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 25.06.2022.
//

import Foundation
import Alamofire

class MovieService {
    // MARK: - Enum
    enum Route: String {
        case nowPlaying = "now_playing"
        case upComing = "upcoming"
        case movieDetails = ""
    }
    
    enum NetworkResponse<T> {
        case responseSuccess(T)
        case responseFail(NetworkError)
    }
    
    enum NetworkError {
        case unknown
        case noData
    }
    
    // MARK: - Typealias
    typealias ErrorHandler = (_ errorMessage: String) -> Void
    
    // MARK: - Properties
    static let shared = MovieService()
    
    // MARK: - BaseURL
    let baseUrl = "https://api.themoviedb.org/3/movie/"
    
    // MARK: - ApiKey
    let apiKey = "317863a86401cd4592cfbe000fd43565"
    
    // MARK: - FilePath
    let baseImageUrl = "https://image.tmdb.org/t/p/original"
    
    // MARK: - IMDBPath
    let baseIMDBUrl = "https://www.imdb.com/title/"
    let baseIMDBHomeUrl = "https://www.imdb.com/"
    
    func request<E: Encodable, D: Decodable>(route: Route?,
                                             parameters: E,
                                             movieDetailsId: String = "",
                                             completion: @escaping (NetworkResponse<D>) -> Void) {
        guard let url = route?.rawValue else {
            return completion(.responseFail(.unknown))
        }
        let endPoint = baseUrl + url + movieDetailsId
        
        do {
            let parameters = try parameters.asDictionary()
            AF.request(endPoint, method: .get, parameters: parameters, encoding: URLEncoding.default).responseData { [weak self] data in
                switch data.result {
                case let .success(responseData):
                    self?.handleDataResponse(data: responseData, completion: completion)
                case .failure:
                    completion(.responseFail(.unknown))
                }
            }
        } catch let error as NSError {
            print(error.userInfo)
        }
    }
    
    private func handleDataResponse<D: Decodable>(data: Data?, completion: @escaping (NetworkResponse<D>) -> Void) {
        
        guard let data = data else {
            return completion(.responseFail(.unknown))
        }
        do {
            let model = try JSONDecoder().decode(D.self, from: data)
            completion(.responseSuccess(model))
        } catch let error as NSError {
            print(error.userInfo)
        }
    }
    
    // MARK: - Action Now Playing - Slider
    func getNowPlaying(page: Int, completion: @escaping (NetworkResponse<MoviesResponse>) -> Void) {
        request(route: .nowPlaying, parameters: UrlParameter(page: page), completion: completion)
    }
    
    // MARK: - Action Up Coming - List
    func getUpComing(page: Int, completion: @escaping (NetworkResponse<MoviesResponse>) -> Void) {
        request(route: .upComing, parameters: UrlParameter(page: page), completion: completion)
    }
    
    // MARK: - Action getMovieDetails - Slider
    func getMovieDetails(with id: String, completion: @escaping (NetworkResponse<Movie>) -> Void) {
        request(route: .movieDetails, parameters: MovieDetailsUrlParameter(), movieDetailsId: id, completion: completion)
    }
}
