//
//  MovieDetailPresesnter.swift
//  UpcomingMovies
//
//  Created by Adriano Song on 15/10/2018.
//  Copyright © 2018 Adriano Song. All rights reserved.
//

import Foundation

class MovieDetailPresenter {
    
    func callMovieDetail(myMovie: MovieViewModel?, completion: @escaping (_ movieDetailVM: MovieDetailViewModel) -> ()){
        
        if let movieId = myMovie?.movieId {
            MyHTTPRequester.getMovieDetail(id: movieId) { (movieDetail) in
                
                guard let myMovieDetail = movieDetail else {
                    return
                }
                
                completion(MovieDetailViewModel(movieDetail: myMovieDetail))
            }
        }
    }
}
