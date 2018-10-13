//
//  MovieDetail.swift
//  UpcomingMovies
//
//  Created by Adriano Song on 29/09/2018.
//  Copyright © 2018 Adriano Song. All rights reserved.
//

import Foundation

struct MovieDetail: Decodable {
    
    let adult: Bool?
    let backdropPath: String?
    let belongsToCollection: BelongsToCollection?
    let budget: Int?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let imdbId: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Float?
    let posterPath: String?
    let productionCompanies: [ProductionCompanie]?
    let productionCountries: [ProductionCountry]?
    let releaseDate: String?
    let revenue: Int?
    let runtime: Int?
    let spokenLanguages: [SpokenLanguage]?
    let status: String?
    let tagline: String?
    let title: String?
    let video: Bool?
    let voteAverage: Float?
    let voteCount: Int?
    
    enum CodingKeys : String, CodingKey {
        
        case adult
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget
        case genres
        case homepage
        case id
        case imdbId = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue
        case runtime
        case spokenLanguages = "spoken_languages"
        case status
        case tagline
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    struct BelongsToCollection: Decodable {
        
        let id: Int?
        let name: String?
        let posterPath: String?
        let backdropPath: String?
        
        enum CodingKeys : String, CodingKey {
            
            case backdropPath = "backdrop_path"
            case id
            case name
            case posterPath = "poster_path"
        }
    }
    
    struct Genre: Decodable {
        
        let id: Int?
        let name: String?
        
        enum CodingKeys : String, CodingKey {
            
            case id
            case name
        }
    }
    
    struct ProductionCompanie: Decodable {
        
        let id: Int?
        let logoPath: String?
        let name: String?
        let originCountry: String?
        
        enum CodingKeys : String, CodingKey {
            
            case logoPath = "logo_path"
            case id
            case name
            case originCountry = "origin_country"
        }
    }
    
    struct ProductionCountry: Decodable {
        
        let iso31661: String?
        let name: String?
        
        enum CodingKeys : String, CodingKey {
            
            case iso31661 = "iso_3166_1"
            case name
        }
    }
    
    struct SpokenLanguage: Decodable {
        
        let iso6391: String?
        let name: String?
        
        enum CodingKeys : String, CodingKey {
            
            case iso6391 = "iso_639_1"
            case name
        }
    }
}
