//
//  TrendingMovieListCell.swift
//  MovieDesk
//
//  Created by Srivalli Velusamy on 12/06/21.
//

import UIKit

class TrendingMovieListCell: UICollectionViewCell {
    
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var displayLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var voteAvgLabel: UILabel!
    @IBOutlet weak var circleProgressView: CircleProgressView!
    
    func setMovieData(_ movie: Movie) {
        self.displayLabel.text = movie.title
        self.dateLabel.text = movie.releaseDate
        let url = URL(string: movie.image)
        backgroundImage.kf.setImage(with: url)
        backgroundImage.setCorner()
        let voteAvg = movie.voteAvg / 10.0
        self.circleProgressView.setProgress(voteAvg, animated: false)
        let voteAvgStr = String(format: "%g", movie.voteAvg * 10.0)
        self.voteAvgLabel.text = "\(voteAvgStr)%"
    }
}
