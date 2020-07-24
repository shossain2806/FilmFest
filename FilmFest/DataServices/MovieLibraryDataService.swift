//
//  MovieLibraryDataService.swift
//  FilmFest
//
//  Created by Md. Saber Hossain on 22/7/20.
//  Copyright © 2020 Md. Saber Hossain. All rights reserved.
//

import UIKit

enum LibrarySection: Int {
    case moviesToSee
    case moviesSeen
}

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
  
    var movieManager : MovieManager?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let manager = movieManager else { return 0 }
        guard let librarySection = LibrarySection(rawValue: section) else { return 0 }
        switch librarySection {
        case .moviesToSee:
            return manager.moviesToSeeCount
        case .moviesSeen:
            return manager.moviesSeenCount
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieManager = movieManager else { fatalError() }
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else { fatalError() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! MovieCell
        
        let movie = librarySection == .moviesToSee ? movieManager.movieAtIndex(indexPath.row) : movieManager.checkedOffMovieAtIndex(indexPath.row)
        cell.configMovieCell(movie: movie)
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieManager = movieManager else { fatalError() }
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else { fatalError() }
        
        if librarySection == .moviesToSee {
            movieManager.checkOffMovieAtIndex(0)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }
        let sectionTitle = librarySection == .moviesToSee ? "Movies To See" : "Movies Seen"
        return sectionTitle
    }
}
