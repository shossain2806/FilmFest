//
//  Movie.swift
//  FilmFest
//
//  Created by Md. Saber Hossain on 22/7/20.
//  Copyright © 2020 Md. Saber Hossain. All rights reserved.
//

import Foundation

struct Movie: Equatable {
    
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.title == rhs.title && lhs.releaseDate == rhs.releaseDate
    }
}
