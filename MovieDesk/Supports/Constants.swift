//
//  Constants.swift
//  MovieDesk
//
//  Created by Srivalli Velusamy on 12/06/21.
//

import Foundation

class Constants {
    static let trendingUrl = "https://api.themoviedb.org/3/trending/all/day?api_key=7e718bbe884ff492360be457092aa3fb"
    static let popularUrl = "https://api.themoviedb.org/3/movie/popular?api_key=7e718bbe884ff492360be457092aa3fb&language=en-US&page=1"
    static let imageUrl = "https://image.tmdb.org/t/p/w500"
    static let TrendingCellIdentifier = "TrendingMovieListCell"
    static let PopularCellIdentifier = "PopularMovieListCell"
    static let DetailSegue = "movieListToDetail"
}

enum MovieType {
    case popular
    case trending
}
