//
//  MovieDetailViewModelTests.swift
//  UpcomingMoviesTests
//
//  Created by Adriano Song on 29/09/2018.
//  Copyright © 2018 Adriano Song. All rights reserved.
//

import XCTest
@testable import UpcomingMovies

class MovieDetailViewModelTests: XCTestCase {
    
    let movieDetailVMEmptyValues = MovieDetailViewModel(movieDetail: MovieDetail(adult: false, backdropPath: "", belongsToCollection: nil, budget: 0, genres: [], homepage: "", id: 0, imdbId: "", originalLanguage: "", originalTitle: "", overview: "", popularity: 0.0, posterPath: "", productionCompanies: nil, productionCountries: nil, releaseDate: "", revenue: 0, runtime: 0, spokenLanguages: nil, status: "", tagline: "", title: "", video: false, voteAverage: 0.0, voteCount: 0))
    
    let movieDetailVMNilValues = MovieDetailViewModel(movieDetail: MovieDetail(adult: nil, backdropPath: nil, belongsToCollection: nil, budget: nil, genres: nil, homepage: nil, id: nil, imdbId: nil, originalLanguage: nil, originalTitle: nil, overview: nil, popularity: nil, posterPath: nil, productionCompanies: nil, productionCountries: nil, releaseDate: nil, revenue: nil, runtime: nil, spokenLanguages: nil, status: nil, tagline: nil, title: nil, video: nil, voteAverage: nil, voteCount: nil))
    
    let movieDetailVMParcialValues = MovieDetailViewModel(movieDetail: MovieDetail(adult: nil, backdropPath: nil, belongsToCollection: nil, budget: nil, genres: [MovieDetail.Genre(id: 123, name: "Drama"), MovieDetail.Genre(id: 456, name: "Horror"), MovieDetail.Genre(id: 789, name: "Romantic")], homepage: nil, id: nil, imdbId: nil, originalLanguage: nil, originalTitle: "Original Title", overview: "My movie overview", popularity: nil, posterPath: "http://mysite/myposter123.jpeg", productionCompanies: nil, productionCountries: nil, releaseDate: "2018-10-08", revenue: nil, runtime: nil, spokenLanguages: nil, status: nil, tagline: nil, title: nil, video: nil, voteAverage: nil, voteCount: nil))
    
    let movieDetailVMReleaseDateMalFormatted = MovieDetailViewModel(movieDetail: MovieDetail(adult: nil, backdropPath: nil, belongsToCollection: nil, budget: nil, genres: [MovieDetail.Genre(id: 123, name: "Drama"), MovieDetail.Genre(id: 456, name: "Horror"), MovieDetail.Genre(id: 789, name: "Romantic")], homepage: nil, id: nil, imdbId: nil, originalLanguage: nil, originalTitle: "Original Title", overview: "My movie overview", popularity: nil, posterPath: "http://mysite/myposter123.jpeg", productionCompanies: nil, productionCountries: nil, releaseDate: "Mal Formatted Date", revenue: nil, runtime: nil, spokenLanguages: nil, status: nil, tagline: nil, title: nil, video: nil, voteAverage: nil, voteCount: nil))
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMovieDetailVMOriginalTitleEmpty() {
        
        XCTAssertEqual("", movieDetailVMEmptyValues.movieOriginaltitle)
    }
    
    func testMovieDetailVMOriginalTitleNil() {
        
        XCTAssertEqual(nil, movieDetailVMNilValues.movieOriginaltitle)
    }
    
    func testMovieDetailOriginalTitleValue() {
        
        XCTAssertEqual("Original Title", movieDetailVMParcialValues.movieOriginaltitle)
    }
    
    func testMovieDetailReleaseDateEmpty() {
        
        XCTAssertEqual("", movieDetailVMEmptyValues.movieReleaseDate)
    }
    
    func testMovieDetailReleaseDateNil(){
        
        XCTAssertEqual("", movieDetailVMNilValues.movieReleaseDate)
    }
    
    func testMovieDetailReleaseDateValue() {
        
        XCTAssertEqual("Oct 8, 2018", movieDetailVMParcialValues.movieReleaseDate)
    }
    
    func testMovieDetailReleaseDataMalFormattedValue() {
        
        XCTAssertEqual("", movieDetailVMReleaseDateMalFormatted.movieReleaseDate)
    }
    
    func testMovieDetailVMPosterPathEmpty() {
        
        XCTAssertEqual("", movieDetailVMEmptyValues.moviePosterPath)
    }
    
    func testMovieDetailVMPosterPathNil() {
        
        XCTAssertEqual(nil, movieDetailVMNilValues.moviePosterPath)
    }
    
    func testMovieDetailVMPosterPathValue() {
        
        XCTAssertEqual("http://mysite/myposter123.jpeg", movieDetailVMParcialValues.moviePosterPath)
    }
    
    func testMovieDetailVMOverviewEmpty() {
        
        XCTAssertEqual("", movieDetailVMEmptyValues.movieOverView)
    }
    
    func testMovieDetailVMOverviewNil() {
        
        XCTAssertEqual(nil, movieDetailVMNilValues.movieOverView)
    }
    
    func testMovieDetailVMOverviewValue() {
        
        XCTAssertEqual("My movie overview", movieDetailVMParcialValues.movieOverView)
    }
    
    func testMovieVMDetailGenresEmpty() {
        
        XCTAssertEqual("", movieDetailVMEmptyValues.movieGenreArray)
    }
    
    func testMovieDetailGenresNil() {
        
        XCTAssertEqual("", movieDetailVMNilValues.movieGenreArray)
    }
    
    func testMovieDetailGenresValue() {
        
        XCTAssertEqual("Drama, Horror, Romantic", movieDetailVMParcialValues.movieGenreArray)
    }
    
}
