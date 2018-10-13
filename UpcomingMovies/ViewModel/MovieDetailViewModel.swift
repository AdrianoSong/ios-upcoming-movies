//
//  MovieDetailViewModel.swift
//  UpcomingMovies
//
//  Created by Adriano Song on 29/09/2018.
//  Copyright © 2018 Adriano Song. All rights reserved.
//

import Foundation


struct MovieDetailViewModel {
   
    let movieOriginaltitle: String?
    let movieReleaseDate: String?
    let moviePosterPath: String?
    let movieGenreArray: String?
    let movieOverView: String?
    
    init(movieDetail: MovieDetail) {
        
        self.movieOriginaltitle = movieDetail.originalTitle
        self.moviePosterPath = movieDetail.posterPath
        self.movieOverView = movieDetail.overview
        
        self.movieGenreArray = movieDetail.genres?.compactMap({return $0.name}).joined(separator: ", ") ?? ""
        
        if let releaseDate = movieDetail.releaseDate {
            self.movieReleaseDate = DateUtils.dateLocale(myDateString: releaseDate)
        } else {
            self.movieReleaseDate = ""
        }
    }
}
