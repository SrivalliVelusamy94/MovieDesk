//
//  PopularMovieList.swift
//  MovieDesk
//
//  Created by Srivalli Velusamy on 12/06/21.
//

import UIKit

class PopularMovieList: UITableView {
    
    fileprivate var movieList = [Movie]()
    fileprivate var viewModal: MovieListModal! = nil
    
    /* View Initialize */
    func initList(_ viewModal: MovieListModal) {
        self.viewModal = viewModal
        movieList = viewModal.getPopularMovieList()
        self.dataSource = self
        self.delegate = self
    }
}

extension PopularMovieList : UITableViewDataSource {
    
    /* Datasource functions */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueReusableCell(withIdentifier: Constants.PopularCellIdentifier, for: indexPath as IndexPath) as! PopularMovieListCell
        movieCell.setMovieData(movieList[indexPath.item])
        return movieCell
    }
    
}

extension PopularMovieList : UITableViewDelegate {
    
    /* Delegate functions */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movieList[indexPath.item]
        self.viewModal.setCurrentMovie(movie)
        self.viewModal.delegate?.didShowMovie()
    }
}
