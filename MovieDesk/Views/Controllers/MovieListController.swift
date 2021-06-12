//
//  MovieListController.swift
//  MovieDesk
//
//  Created by Srivalli Velusamy on 12/06/21.
//

import UIKit

class MovieListController: UIViewController, MovieListModalDelegate {
    @IBOutlet var trendingMovieList: TrendingMovieList!
    @IBOutlet var popularMovieList: PopularMovieList!
    var movieModal : MovieListModal!
    
    /* override functions */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initMainView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let movieDetail = segue.destination as? MovieDetailViewController else { return }
        movieDetail.currentMovie = movieModal.getCurrentMovie()
    }
    
    /* Delegate - MovieListModal */
    func didShowMovie() {
        self.performSegue(withIdentifier: Constants.DetailSegue, sender: nil)
    }
    
    /* Private function */
    fileprivate func initMainView() {
        movieModal = MovieListModal()
        movieModal.delegate = self
        let timeDelay = movieModal.isDataLoadedAlready() ? 0.0 : 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + timeDelay, execute: {
            self.trendingMovieList.initList(self.movieModal)
            self.popularMovieList.initList(self.movieModal)
            self.popularMovieList.reloadData()
        })
    }
}

