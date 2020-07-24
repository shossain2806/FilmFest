//
//  MovieManagerTests.swift
//  FilmFestTests
//
//  Created by Md. Saber Hossain on 22/7/20.
//  Copyright © 2020 Md. Saber Hossain. All rights reserved.
//

import XCTest
@testable import FilmFest

class MovieManagerTests: XCTestCase {

    var sut : MovieManager! //system under test
    let inception = Movie(title: "Inception")
    let godzilla = Movie(title: "Godzilla")
    let titanic = Movie(title: "Titanic")
    
    override func setUp() {
        super.setUp()
        sut = MovieManager()
    }
    
    //MARK:- Initial Values

    func testInit_MoviesToSee_ReturnsZero() {
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnsZero() {
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    //MARK:- Add & Query
    func testAdd_MovieToSee_ReturnsOne() {
        
        sut.addMovie(inception)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex() {
        sut.addMovie(godzilla)
        
        let movieQueried = sut.movieAtIndex(0)
        XCTAssertEqual(godzilla.title, movieQueried.title)
    }
    
    
    //MARK:- Checking off
    func testCheckOffMovie_UpdateMovieManagerCount() {
      
        sut.addMovie(titanic)
        sut.checkOffMovieAtIndex(0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    
    func testCheckOffMovie_RemoveMoviesFromArray() {
        sut.addMovie(inception)
        sut.addMovie(godzilla)
        sut.checkOffMovieAtIndex(0)
        XCTAssertEqual(sut.movieAtIndex(0).title, godzilla.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex() {
        sut.addMovie(titanic)
        sut.checkOffMovieAtIndex(0)
        
        let movieQueried = sut.checkedOffMovieAtIndex(0)
        
        XCTAssertEqual(titanic.title, movieQueried.title)
    }
    
    func testClearArrays_ReturnArrayCountZero() {
        sut.addMovie(inception)
        sut.addMovie(titanic)
        sut.checkOffMovieAtIndex(0)
      
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 0)
        
    }
    
    // MARK: Duplicate
    func testDuplicateMovies_ShouldNotBeAddedToArray() {
        sut.addMovie(inception)
        sut.addMovie(inception)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
}
