//
//  HomeViewModel.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 25.06.2022.
//

import Foundation
import ImageSlideshow

class HomeViewModel {
    var movies: [Movie] = [Movie(posterPath: "https://resources-live.sketch.cloud/files/ab188b19-2889-4870-afec-a3866fe0d17a.png?Expires=1656450000&Signature=sYfbRFS2yd1brAGc9RAZQZ7p-RyBt-9wI3~zi~8GwCnEBQTwMES9rna8Qs-7AKYFLKDpvV9PhYfuZi7wF4t0zU-mIhraaJsX9K8k3SO22vtXccMO8l9XdN3uQ87TWCHwZzu7LRr29YnxJCDr67fLnHXqAfSVy9QqYwJF2f90zU0_&Key-Pair-Id=APKAJOITMW3RWOLNNPYA", title: "The Great Beauty (2013)", overview: "Jep Gambardella has seduced his way through the lavish…", releaseDate: "15.06.2021")]

    var currentPage: Int = 0
    var maxPage: Int?

    func numberOfRowsInSection(_: Int) -> Int {
        return movies.count
    }

    func getImagesUrl() -> [InputSource]{
        var array: [InputSource] = []
        let url = URL(string: "https://thumbs.dreamstime.com/b/environment-earth-day-hands-trees-growing-seedlings-bokeh-green-background-female-hand-holding-tree-nature-field-gra-130247647.jpg")!
        if let data = try? Data(contentsOf: url) {
            array.append(ImageSource(image: UIImage(data: data)!))
        }
        return array
    }

    func movieAtIndex(_ index: Int) -> Movie {
        let url = movies[index].posterPath
        let title = movies[index].title
        let description = movies[index].overview
        let date = movies[index].releaseDate
        return Movie(posterPath: url, title: title, overview: description, releaseDate: date)
    }
}

class MoviesViewModel {
    private let movie: Movie

    init(_ movie: Movie) {
        self.movie = movie
    }

    var url: String {
        return self.movie.posterPath
    }

    var title: String {
        return self.movie.title
    }

    var description: String {
        return self.movie.overview
    }

    var date: String {
        return self.movie.releaseDate
    }
}

