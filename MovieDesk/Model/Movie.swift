//
//  Movie.swift
//  MovieDesk
//
//  Created by Srivalli Velusamy on 12/06/21.
//

import Foundation

struct Movie {
    var id: String = ""
    var title: String = ""
    var image: String = ""
    var releaseDate: String = ""
    var voteAvg: Double = 0.0
    var overview: String = ""
    var type: MovieType = .popular
    
    init(data: [String: Any], type: MovieType) {
        let originTitle = data["original_name"] as? String ?? ""
        let movieId = data["id"] as? Int ?? 0
        self.id = String(movieId)
        self.title = data["title"] as? String ?? originTitle
        let imageData = data["poster_path"] as? String ?? ""
        self.image = "\(Constants.imageUrl)\(imageData)"
        self.releaseDate = data["release_date"] as? String ?? "Upcoming"
        self.overview = data["overview"] as? String ?? ""
        self.voteAvg = data["vote_average"] as? Double ?? 0.0
        self.type = type
    }
}
