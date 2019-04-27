//
//  MovieController.swift
//  MovieList
//
//  Created by Michael Stoffer on 4/27/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import Foundation

class MovieController {
    private (set) var movies: [Movie] = []
    
    func createMovie(with title: String) {
        let movie = Movie(title: title)
        movies.append(movie)
    }
}
