//
//  MovieCellTests.swift
//  FilmFestTests
//
//  Created by Md. Saber Hossain on 23/7/20.
//  Copyright © 2020 Md. Saber Hossain. All rights reserved.
//

import XCTest
@testable import FilmFest

class MovieCellTests: XCTestCase {
    var tableView: UITableView!
    var mocDataSource: MockCellDataSource!
  
    override func setUp() {
        super.setUp()
        let libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LibraryViewController") as! LibraryViewController
        _ = libraryVC.view
        tableView = libraryVC.tableView
        mocDataSource = MockCellDataSource()
        tableView.dataSource = mocDataSource
    }
    
    func testCell_Config_ShouldSetLabelsToMovieData() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: IndexPath(row: 0, section: 0)) as! MovieCell
        cell.configMovieCell(movie: Movie(title: "Batman", releaseDate: "1990"))
        
        XCTAssertEqual(cell.textLabel?.text, "Batman")
        XCTAssertEqual(cell.detailTextLabel?.text, "1990")
    }
}
