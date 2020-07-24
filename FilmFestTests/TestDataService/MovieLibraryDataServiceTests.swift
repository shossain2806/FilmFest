//
//  MovieLibraryDataServiceTests.swift
//  FilmFestTests
//
//  Created by Md. Saber Hossain on 22/7/20.
//  Copyright © 2020 Md. Saber Hossain. All rights reserved.
//

import XCTest
@testable import FilmFest

class MovieLibraryDataServiceTests: XCTestCase {
    
    var sut : MovieLibraryDataService!
    var libraryTableView : UITableView!
    var libraryVC : LibraryViewController!
    var tableViewMock : TableViewMock!
    
    let inception = Movie(title: "Inception")
    let godzilla = Movie(title: "Godzilla")
    let titanic = Movie(title: "Titanic")
    
    override func setUp() {
        super.setUp()
        
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        
        tableViewMock = TableViewMock.initMock(dataSource: sut)
        
        libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LibraryViewController") as LibraryViewController
        _ = libraryVC.view
        libraryTableView = libraryVC.tableView
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
    }
    
    //MARK: Sections
    
    func testTableViewSections_Count_ReturnsTwo() {
        
        let sections = libraryTableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    
    func testTableViewSections_SectionOne_ReturnsMoviesToSeeCount() {
//        sut.movieManager?.addMovie(inception)
//        sut.movieManager?.addMovie(godzilla)
//
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
//
//        sut.movieManager?.addMovie(titanic)
//        libraryTableView.reloadData()
//
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 5)
    }
    
    func testTableViewSections_SectionTwo_ReturnsMoviesSeenCount() {
//        sut.movieManager?.addMovie(inception)
//        sut.movieManager?.addMovie(godzilla)
//        sut.movieManager?.checkOffMovieAtIndex(0)
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
//        sut.movieManager?.checkOffMovieAtIndex(0)
//        libraryTableView.reloadData()
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 0)
    }
    
    //MARK: Cells
    
    func testCell_RowAtIndex_ReturnsMovieCell() {
        sut.movieManager?.addMovie(titanic)
        libraryTableView.reloadData()
        let cell = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is MovieCell)
    }
    
    func testCell_ShouldDequeueCell() {
        
        sut.movieManager?.addMovie(titanic)
        tableViewMock.reloadData()
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(tableViewMock.cellDequeueProperly)
    }
    
    func testCell_SectionOneConfig_ShouldSetCellData() {
        
        sut.movieManager?.addMovie(titanic)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
        XCTAssertEqual(cell.movieData, titanic)
        
    }
    
    func testCell_SectionTwoConfig_ShouldSetCellData() {
        
        sut.movieManager?.addMovie(titanic)
        sut.movieManager?.addMovie(inception)
        sut.movieManager?.checkOffMovieAtIndex(0)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock
        XCTAssertEqual(cell.movieData, titanic)
        
    }
    
    func testCell_Selection_ShouldCheckOffSelectedMovie() {
        sut.movieManager?.addMovie(titanic)
        sut.movieManager?.addMovie(inception)
        libraryTableView.delegate?.tableView!(libraryTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.movieManager?.moviesToSeeCount, 1)
        XCTAssertEqual(sut.movieManager?.moviesSeenCount, 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
    }
    
    func testTableViewSectionTitle_ShouldHaveCorrectStringValues() {
        let section1Title = libraryTableView.dataSource?.tableView!(libraryTableView, titleForHeaderInSection: 0)
        let section2Title = libraryTableView.dataSource?.tableView!(libraryTableView, titleForHeaderInSection: 1)
        
        XCTAssertEqual(section1Title, "Movies To See")
        XCTAssertEqual(section2Title, "Movies Seen")
    }
}
