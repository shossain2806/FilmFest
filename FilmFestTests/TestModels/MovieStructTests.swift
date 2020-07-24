//
//  MovieStructTests.swift
//  FilmFestTests
//
//  Created by Md. Saber Hossain on 22/7/20.
//  Copyright © 2020 Md. Saber Hossain. All rights reserved.
//

import XCTest
@testable import FilmFest

class MovieStructTests: XCTestCase {

    // MARK: Initialization
    func testInit_MovieWithTitle() {
        let testMovie = Movie(title: "Generic Blockbuster")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Generic Blockbuster")
        
    }
    
    func testInit_SetMovieTitleAndReleaseDate() {
        let testMovie = Movie(title: "Romantic Comedy", releaseDate: "1999")
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "1999")
    }

    // MARK: Equatable
    func testEquatable_ReturnsTrue() {
        let movie1 = Movie(title: "Prince of Persia")
        let movie2 = Movie(title: "Prince of Persia")
        
        XCTAssertEqual(movie1, movie2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentTitles() {
        let movie1 = Movie(title: "Prince of Persia")
        let movie2 = Movie(title: "Avatar")
        
        XCTAssertNotEqual(movie1, movie2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentReleaseDates() {
        let movie1 = Movie(title: "Prince of Persia", releaseDate: "1998")
        let movie2 = Movie(title: "Prince of Persia", releaseDate: "1999")
        
        XCTAssertNotEqual(movie1, movie2)
    }
    
    func testEquatable_ReturnsEqualForSameProperties() {
        let movie1 = Movie(title: "Prince of Persia", releaseDate: "1998")
        let movie2 = Movie(title: "Prince of Persia", releaseDate: "1998")
           
        XCTAssertEqual(movie1, movie2)
    }
}
