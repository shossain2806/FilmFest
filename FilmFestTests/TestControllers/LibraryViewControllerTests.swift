//
//  LibraryViewControllerTests.swift
//  FilmFestTests
//
//  Created by Md. Saber Hossain on 22/7/20.
//  Copyright © 2020 Md. Saber Hossain. All rights reserved.
//

import XCTest
@testable import FilmFest

class LibraryViewControllerTests: XCTestCase {

    var sut : LibraryViewController!
    
    // MARK: Nill checks
    override func setUp() {
        super.setUp()
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LibraryViewController") as LibraryViewController
        _ = sut.view
    }

    func testLibraryVC_tableViewShouldNotBeNil() {
        
        XCTAssertNotNil(sut.tableView)
    }
    
    //MARK: DataSource
    
    func testDataSource_ViewDidLoad_SetsTableViewDataSource() {
        XCTAssertNotNil(sut.tableView.dataSource)
        XCTAssertTrue(sut.tableView.dataSource is MovieLibraryDataService)
    }
    
    func testDelegate_ViewDidLoad_SetsTableViewDelegate() {
        XCTAssertNotNil(sut.tableView.delegate)
        XCTAssertTrue(sut.tableView.delegate is MovieLibraryDataService)
    }
    
    //MARK: Data Service Assumption
    
    func testDataService_ViewDidLoad_SingleDataServiceObject() {
        XCTAssertEqual(sut.tableView.dataSource as! MovieLibraryDataService, sut.tableView.delegate as! MovieLibraryDataService)
    }
}
