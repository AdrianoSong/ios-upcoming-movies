//
//  MovieViewModel.swift
//  UpcomingMovies
//
//  Created by Adriano Song on 28/09/2018.
//  Copyright © 2018 Adriano Song. All rights reserved.
//

import Foundation

struct MovieViewModel {
    
    let movieId: Int?
    let movieTitle: String?
    let movieReleaseDate: String?
    let moviePosterPath: String?
    
    init(movie: Movie) {
        self.movieId = movie.id
        self.movieTitle = movie.title
        self.moviePosterPath = movie.posterPath
        
        if let releaseDate = movie.releaseDate {
            self.movieReleaseDate = DateUtils.dateLocale(myDateString: releaseDate)
        } else {
            self.movieReleaseDate = ""
        }
    }
}
