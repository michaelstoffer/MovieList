//
//  MoviesTableViewController.swift
//  MovieList
//
//  Created by Michael Stoffer on 4/27/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController, MovieControllerProtocol {

    var movieController: MovieController? = MovieController()
    @IBOutlet weak var movieTitleTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieController!.movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        
        let movie = self.movieController?.movies[indexPath.row]
        
        cell.textLabel?.text = movie!.title
        
        return cell
    }

    @IBAction func addMovieButtonTapped(_ sender: Any) {
        guard let title = self.movieTitleTextField.text else { return }
        
        self.movieController?.createMovie(with: title)
        
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToMovieTitle" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let movieViewController = segue.destination as? MovieViewController else { return }
            
            let movie = self.movieController?.movies[indexPath.row]
            print(movie)
            movieViewController.movie = movie
        }
    }

}
