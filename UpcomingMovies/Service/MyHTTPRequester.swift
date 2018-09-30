//
//  MyHTTPRequester.swift
//  UpcomingMovies
//
//  Created by Adriano Song on 28/09/2018.
//  Copyright © 2018 Adriano Song. All rights reserved.
//

import Foundation
import UIKit

class MyHTTPRequester {
    
    static func httRequest(url: URL, completion: @escaping (_ myData: Data?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion(data)
            }.resume()
    }
    
    static func getMovies(pageNumber: Int, completion: @escaping (_ movieArray: [Movie]?) -> ()) {
        
        guard let movieURL = URL(string: Constants.GET_MOVIES_URL + "\(pageNumber)") else {
            return
        }
        
        MyHTTPRequester.httRequest(url: movieURL) { (data) in
            guard let myData = data else {
                return
            }
            
            do {
                let moviesResult = try JSONDecoder().decode(MovieResult.self, from: myData)
                
                completion(moviesResult.movies)
                
            } catch let requestError {
                print(requestError.localizedDescription)
            }
        }
    }
    
    static func getMovieDetail(id: Int, completion: @escaping (_ movie: MovieDetail?) -> ()) {
        
        guard let movieDetailURL = URL(string: "\(Constants.BASE_MOVIE_URL)\(id)?api_key=\(Constants.MY_API_KEY)&language=en-US") else {
            return
        }
        
        MyHTTPRequester.httRequest(url: movieDetailURL) { (data) in
            
            guard let myData = data else {
                return
            }
            
            do {
                
                let movieDetail = try JSONDecoder().decode(MovieDetail.self, from: myData) as MovieDetail
                
                completion(movieDetail)
                
            } catch let requestError {
                print(requestError.localizedDescription)
            }
        }
    }
    
    static func getImageFromWeb(stringURL: String, imageScale: CGFloat, completion: @escaping (_ imgData: UIImage) ->()) {
        
        guard let imageURL = URL(string: stringURL) else {
            return
        }
        
        MyHTTPRequester.httRequest(url: imageURL) { (data) in
            guard let myImageData = data else {
                return
            }
            
            if let myImage = UIImage(data: myImageData, scale: imageScale) {
                completion(myImage)
            }
        }
    }
}
