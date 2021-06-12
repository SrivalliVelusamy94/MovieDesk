//
//  TrendingMovieList.swift
//  MovieDesk
//
//  Created by Srivalli Velusamy on 12/06/21.
//

import UIKit

class TrendingMovieList: UICollectionView {
    
    fileprivate var movieList = [Movie]()
    fileprivate var viewModal: MovieListModal! = nil
    
    /* View Initialize */
    func initList(_ viewModal: MovieListModal) {
        self.viewModal = viewModal
        movieList = viewModal.getTrendingList().limit(10)
        self.dataSource = self
        self.delegate = self
    }
}

extension TrendingMovieList : UICollectionViewDataSource {
    
    /* Datasource functions */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.TrendingCellIdentifier, for: indexPath as IndexPath) as! TrendingMovieListCell
        movieCell.setMovieData(movieList[indexPath.item])
        return movieCell
    }
}

extension TrendingMovieList : UICollectionViewDelegateFlowLayout {
    
    /* Delegate functions */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movieList[indexPath.item]
        self.viewModal.setCurrentMovie(movie)
        self.viewModal.delegate?.didShowMovie()
    }
}
