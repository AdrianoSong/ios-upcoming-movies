//
//  MainPresenter.swift
//  UpcomingMovies
//
//  Created by Adriano Song on 29/09/2018.
//  Copyright © 2018 Adriano Song. All rights reserved.
//

import Foundation
import UIKit

class MainPresenter {

    var movieViewModel = [MovieViewModel]()
    var searchedMovies = [MovieViewModel]()
    
    var fetchMoreMovies = false
    
    func fetchMovies(page: Int, completion: @escaping() -> ()){
        
        MyHTTPRequester.getMovies(pageNumber: page) { (movies) in
            
            guard let moviesArray = movies as [Movie]? else {
                return
            }
            
            self.movieViewModel += moviesArray.compactMap({return MovieViewModel(movie: $0)})
            
            completion()
        }
    }
    
    func filterSearchedMovies(userText: String?, completion: @escaping() -> ()) {
        
        searchedMovies = movieViewModel.filter({ movie in
            return (movie.movieTitle?.lowercased().contains(userText?.lowercased() ?? "")) ?? true
        })
        
        completion()
    }
    
    func getMovieSearchedOrNot(indexPath: IndexPath, searchNavigationController: UISearchController) -> MovieViewModel? {
        
        if SearchBarUtils.isSearchBarPerfomingFilter(searchNavigationController: searchNavigationController) {
            return searchedMovies[indexPath.row]
            
        } else {
            return movieViewModel[indexPath.row]
        }
    }
}
