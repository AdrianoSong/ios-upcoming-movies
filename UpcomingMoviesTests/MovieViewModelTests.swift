//
//  MovieViewModelTests.swift
//  UpcomingMoviesTests
//
//  Created by Adriano Song on 29/09/2018.
//  Copyright © 2018 Adriano Song. All rights reserved.
//

import XCTest
@testable import UpcomingMovies

class MovieViewModelTests: XCTestCase {
    
    let movieVMEmptyValues = MovieViewModel(movie: Movie(voteCount: 0, id: 0, video: false, voteAverage: 0.0, title: "", popularity: 0.0, posterPath: "", originalLanguage: "", originalTitle: "", genreIds: [], backdropPath: "", adult: false, overview: "", releaseDate: ""))
    
    let movieVMNilValues = MovieViewModel(movie: Movie(voteCount: nil, id: nil, video: nil, voteAverage: nil, title: nil, popularity: nil, posterPath: nil, originalLanguage: nil, originalTitle: nil, genreIds: nil, backdropPath: nil, adult: nil, overview: nil, releaseDate: nil))
    
    let movieVMParcialValues = MovieViewModel(movie: Movie(voteCount: nil, id: 123, video: nil, voteAverage: nil, title: "Title", popularity: nil, posterPath: "http://mysite.com/myposter123", originalLanguage: nil, originalTitle: nil, genreIds: nil, backdropPath: nil, adult: nil, overview: nil, releaseDate: "2018-08-10"))
    
    let movieVMFullValues = MovieViewModel(movie: Movie(voteCount: 23, id: 123, video: false, voteAverage: 54.00, title: "Title", popularity: 45.00, posterPath: "http://mysite.com/myposter123", originalLanguage: "Original Language", originalTitle: "http://mysite.com/myposter123", genreIds: [1,2,3], backdropPath: "http://mysite.com/mybackdrop123", adult: false, overview: "My movie overview", releaseDate: "2018-08-10"))
    
    let movieVMReleaseDateMalFormatted = MovieViewModel(movie: Movie(voteCount: 23, id: 123, video: false, voteAverage: 54.00, title: "Title", popularity: 45.00, posterPath: "http://mysite.com/myposter123", originalLanguage: "Original Language", originalTitle: "http://mysite.com/myposter123", genreIds: [1,2,3], backdropPath: "http://mysite.com/mybackdrop123", adult: false, overview: "My movie overview", releaseDate: "Mal Formatted Date 123"))
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMovieVMTitleEmpty() {
        
        XCTAssertEqual("", movieVMEmptyValues.movieTitle)
    }
    
    func testMovieVMTitleNil(){
        
        XCTAssertEqual(nil, movieVMNilValues.movieTitle)
    }
    
    func testMovieVMTitleValue(){
        
        XCTAssertEqual("Title", movieVMParcialValues.movieTitle)
        XCTAssertEqual("Title", movieVMFullValues.movieTitle)
    }
    
    func testMovieVMIdEmpty() {
        
        XCTAssertEqual(0, movieVMEmptyValues.movieId)
    }
    
    func testMovieVMIdNil() {
        
        XCTAssertEqual(nil, movieVMNilValues.movieId)
    }
    
    func testMovieVMIdValue() {
        
        XCTAssertEqual(123, movieVMParcialValues.movieId)
        XCTAssertEqual(123, movieVMFullValues.movieId)
    }
    
    func testMovieVMPosterPathEmpty() {
        
        XCTAssertEqual("", movieVMEmptyValues.moviePosterPath)
    }
    
    func testMovieVMPosterPathNil() {
        
        XCTAssertEqual(nil, movieVMNilValues.moviePosterPath)
    }
    
    func testMovieVMPosterPathValue() {
        
        let myPosterURL: String? = "http://mysite.com/myposter123"
        
        XCTAssertEqual(myPosterURL, movieVMParcialValues.moviePosterPath)
        XCTAssertEqual(myPosterURL, movieVMFullValues.moviePosterPath)
    }
    
    func testMovieVMReleaseDateEmpty(){
        
        XCTAssertEqual("", movieVMEmptyValues.movieReleaseDate)
    }
    
    func testMovieVMReleaseDateNil() {
        
        XCTAssertEqual("", movieVMNilValues.movieReleaseDate)
    }
    
    func testMovieVMReleaseDateValue() {
        
        let myDate: String? = "Aug 10, 2018"
        
        XCTAssertEqual(myDate, movieVMParcialValues.movieReleaseDate)
        XCTAssertEqual(myDate, movieVMFullValues.movieReleaseDate)
    }
    
    func testMovieVMReleaseDateMalFormatted() {
        
        XCTAssertEqual("", movieVMReleaseDateMalFormatted.movieReleaseDate)
    }
}
