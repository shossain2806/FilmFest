//
//  LibraryViewController.swift
//  FilmFest
//
//  Created by Md. Saber Hossain on 22/7/20.
//  Copyright © 2020 Md. Saber Hossain. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dataService: MovieLibraryDataService!
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = dataService
        self.tableView.delegate = dataService
        dataService.movieManager = movieManager
        
        dataService.movieManager?.addMovie(Movie(title:"Action", releaseDate: "1999"))
        dataService.movieManager?.addMovie(Movie(title:"Horror", releaseDate: "1980"))
        dataService.movieManager?.addMovie(Movie(title:"Comedy", releaseDate: "2000"))
        dataService.movieManager?.addMovie(Movie(title:"Sci-fi"))
        dataService.movieManager?.addMovie(Movie(title:"Drama"))
        tableView.reloadData()
    }


}

