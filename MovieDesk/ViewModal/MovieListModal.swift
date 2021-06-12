//
//  MovieListModal.swift
//  MovieDesk
//
//  Created by Srivalli Velusamy on 12/06/21.
//

import Foundation

protocol MovieListModalDelegate {
    func didShowMovie()
}

class MovieListModal {
    fileprivate var popularMovieList = [Movie]()
    fileprivate var trendingMovieList = [Movie]()
    fileprivate var currentMovie: Movie! = nil
    var delegate: MovieListModalDelegate!
    
    init() {
        self.setPopularList()
        self.setTrendingList()
    }
    
    deinit {
        self.popularMovieList = []
        self.trendingMovieList = []
        self.currentMovie = nil
        self.delegate = nil
    }
    
    /* Public functions */
    public func getTrendingList() -> [Movie] {
        return self.trendingMovieList
    }
    
    public func getPopularMovieList() -> [Movie] {
        return self.popularMovieList
    }
    
    public func setCurrentMovie(_ movie: Movie) {
        self.currentMovie = movie
    }
    
    public func getCurrentMovie() -> Movie? {
        return self.currentMovie
    }
    
    public func isDataLoadedAlready() -> Bool {
        if let _ = UserDefaults.standard.array(forKey: "results") as? [[String: Any]] {
            return true
        } else {
            return false
        }
    }
    
    /* Private functions */
    fileprivate func setPopularList() {
        self.setMovieList(Constants.popularUrl, type: .popular)
    }
    
    fileprivate func setTrendingList() {
        self.setMovieList(Constants.trendingUrl, type: .trending)
    }
    
    fileprivate func setMovieList(_ parseUrl: String, type: MovieType) {
        if let results = UserDefaults.standard.array(forKey: "results") as? [[String: Any]] {
            self.parseResponse(results, type: type)
        } else {
            URLSession.shared.dataTask(with: NSURL(string: parseUrl)! as URL, completionHandler: { (data, response, error) -> Void in
                if let rawData = data {
                    do {
                        // Parsing json format
                        if let json = try JSONSerialization.jsonObject(with: rawData, options: []) as? [String: Any] {
                            let results = json["results"] as? [[String: Any]] ?? [[String: Any]]()
                            UserDefaults.standard.set(results, forKey: "results")
                            self.parseResponse(results, type: type)
                        }
                    } catch let error as NSError {
                        self.popularMovieList = []
                        self.trendingMovieList = []
                        print("Error in getting list : \(error)")
                    }
                } else {
                    self.popularMovieList = []
                    self.trendingMovieList = []
                }
                
            }).resume()
        }
    }
    
    fileprivate func parseResponse(_ results: [[String: Any]], type: MovieType) {
        if type == .popular {
            self.parsePopularResponse(results)
        } else {
            self.parseTrendingResponse(results)
        }
    }
    
    fileprivate func parseTrendingResponse(_ responseData: [[String: Any]]) {
        var trendingList = [Movie]()
        for data in responseData {
            let movie = Movie(data: data, type: .trending)
            trendingList.append(movie)
        }
        self.trendingMovieList = trendingList
    }
    
    fileprivate func parsePopularResponse(_ responseData: [[String: Any]]) {
        var popularList = [Movie]()
        
        for data in responseData {
            let movie = Movie(data: data, type: .popular)
            popularList.append(movie)
        }
        self.popularMovieList = popularList.sorted(by: { $0.title < $1.title })
    }
}
