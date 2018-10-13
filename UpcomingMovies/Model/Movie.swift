//
//  Movie.swift
//  UpcomingMovies
//
//  Created by Adriano Song on 27/09/2018.
//  Copyright © 2018 Adriano Song. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    
    let voteCount: Int?
    let id: Int?
    let video: Bool?
    let voteAverage: Float?
    let title: String?
    let popularity: Float?
    let posterPath: String?
    let originalLanguage: String?
    let originalTitle: String?
    let genreIds: [Int]?
    let backdropPath: String?
    let adult: Bool?
    let overview: String?
    let releaseDate: String?
    
    enum CodingKeys : String, CodingKey {
        case voteCount = "vote_count"
        case id
        case video
        case voteAverage = "vote_average"
        case title
        case popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIds = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult
        case overview
        case releaseDate = "release_date"
    }
}

struct MovieResult: Decodable {
    
    let movies: [Movie]?
    let page: Int?
    let totalResults: Int?
    let movieDateRange: MovieDateRange?
    let totalPages: Int?
    
    enum CodingKeys : String, CodingKey {
        case movies = "results"
        case page
        case totalResults = "total_results"
        case movieDateRange = "dates"
        case totalPages = "total_pages"
    }
}

struct MovieDateRange: Decodable {
    
    let maximum: String?
    let minimum: String?
    
    enum CodingKeys : String, CodingKey {
        case maximum
        case minimum
    }
}
