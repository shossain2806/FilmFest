//
//  MockExntensions.swift
//  FilmFestTests
//
//  Created by Md. Saber Hossain on 23/7/20.
//  Copyright © 2020 Md. Saber Hossain. All rights reserved.
//

import Foundation
import UIKit
@testable import FilmFest

extension MovieLibraryDataServiceTests {
    
    class TableViewMock: UITableView {
        var cellDequeueProperly : Bool = false
        
        class func initMock(dataSource: MovieLibraryDataService) -> TableViewMock {
            let mock = TableViewMock(frame: CGRect(x: 0, y: 0, width: 300, height: 300), style: .plain)
            mock.dataSource = dataSource
            mock.register(MovieCellMock.self, forCellReuseIdentifier: "tableViewCell")
            return mock
        }
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeueProperly = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
       
    }
    
    class MovieCellMock: MovieCell {
        var movieData: Movie?
        override func configMovieCell(movie: Movie) {
            movieData = movie
        }
    }
    
}

extension MovieCellTests {
    class MockCellDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
    }
}
