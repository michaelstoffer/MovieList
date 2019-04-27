//
//  MovieViewController.swift
//  MovieList
//
//  Created by Michael Stoffer on 4/27/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
 
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    var movie: Movie? {
        didSet {
            setMovieTitle()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMovieTitle()
    }
    
    private func setMovieTitle() {
        guard let movie = self.movie,
            isViewLoaded else { return }
        
        movieTitleLabel.text = movie.title
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
