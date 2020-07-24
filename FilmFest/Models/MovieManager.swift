//
//  MovieManager.swift
//  FilmFest
//
//  Created by Md. Saber Hossain on 22/7/20.
//  Copyright © 2020 Md. Saber Hossain. All rights reserved.
//

import Foundation

class MovieManager {
    var moviesToSeeCount : Int { return moviesToSee.count }
    var moviesSeenCount : Int { return moviesSeen.count }
   
    private var moviesToSee = [Movie]()
    private var moviesSeen = [Movie]()
    
    func addMovie(_ movie: Movie) {
        guard !moviesToSee.contains(movie) else { return }
        moviesToSee.append(movie)
    }
    
    func movieAtIndex(_ index: Int) -> Movie {
        return moviesToSee[index]
    }
    
    func checkOffMovieAtIndex(_ index: Int) {
        guard index < moviesToSeeCount else { return }
        let checkedMovie = moviesToSee.remove(at: index)
        moviesSeen.append(checkedMovie)
    }
    
    func checkedOffMovieAtIndex(_ index: Int) -> Movie {
        return moviesSeen[index]
    }
    
    func clearArrays() {
        moviesToSee.removeAll()
        moviesSeen.removeAll()
    }
}
