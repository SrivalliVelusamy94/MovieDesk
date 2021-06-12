//
//  MovieDetailController.swift
//  MovieDesk
//
//  Created by Srivalli Velusamy on 12/06/21.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var datelabel: UILabel!
    @IBOutlet var overviewTextView: UITextView!
    public var currentMovie: Movie! = nil
    
    override func viewDidLoad() {
        self.initDetailView()
    }
    
    /* Private functions */
    fileprivate func initDetailView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.001, execute: {
            self.setMovieDetail()
        })
    }
    
    fileprivate func setMovieDetail() {
        if let movie = self.currentMovie {
            self.titleLabel.text = movie.title
            self.datelabel.text = movie.releaseDate
            self.overviewTextView.text = movie.overview
            let url = URL(string: movie.image)
            movieImage.contentMode = .scaleAspectFit
            movieImage.kf.setImage(with: url)
        }
    }
    
    /* Mark: Action dismiss */
    @IBAction func onDismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
