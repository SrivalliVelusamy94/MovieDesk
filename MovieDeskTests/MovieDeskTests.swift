//
//  MovieDeskTests.swift
//  MovieDeskTests
//
//  Created by Srivalli Velusamy on 12/06/21.
//

import XCTest
@testable import MovieDesk

class MovieDeskTests: XCTestCase {
    
    private let mockModal = MovieListModal()
    private let mockObject = MockTestData()
    
    func testListData() {
        trendingList()
        popularList()
    }
    
    /* Private functions */
    fileprivate func trendingList() {
        let trendingList = mockModal.getTrendingList()
        XCTAssert(trendingList.count == 20, "Trending list count should be equal")
        let mockTrendingObj = mockObject.getSampleTrendingData()
        let selectedMovie = trendingList.filter({ (movie) in
            return movie.id == mockTrendingObj.id
        })
        
        if selectedMovie.count != 0 {
            XCTAssert(selectedMovie[0].id == mockTrendingObj.id, "Id should be equal")
            XCTAssert(selectedMovie[0].title == mockTrendingObj.title, "Title should be equal")
            XCTAssert(selectedMovie[0].image == mockTrendingObj.image, "Image should be equal")
            XCTAssert(selectedMovie[0].releaseDate == mockTrendingObj.releaseDate, "Release date should be equal")
            XCTAssert(selectedMovie[0].overview == mockTrendingObj.overview, "Overview should be equal")
            XCTAssert(selectedMovie[0].voteAvg == mockTrendingObj.voteAvg, "VoteAverage should be equal")
            XCTAssert(selectedMovie[0].type == mockTrendingObj.type, "Type should be equal")
        }
    }
    
    fileprivate func popularList() {
        let popularList = mockModal.getPopularMovieList()
        XCTAssert(popularList.count == 20, "Popular list count should be equal")
        let mockPopularObject = mockObject.getSamplePopularData()
        let selectedMovie = popularList.filter({ (movie) in
            return movie.id == mockPopularObject.id
        })
        
        if selectedMovie.count != 0 {
            XCTAssert(selectedMovie[0].id == mockPopularObject.id, "Id should be equal")
            XCTAssert(selectedMovie[0].title == mockPopularObject.title, "Title should be equal")
            XCTAssert(selectedMovie[0].image == mockPopularObject.image, "Image should be equal")
            XCTAssert(selectedMovie[0].releaseDate == mockPopularObject.releaseDate, "Release date should be equal")
            XCTAssert(selectedMovie[0].overview == mockPopularObject.overview, "Overview should be equal")
            XCTAssert(selectedMovie[0].voteAvg == mockPopularObject.voteAvg, "VoteAverage should be equal")
            XCTAssert(selectedMovie[0].type == mockPopularObject.type, "Type should be equal")
        }
    }
}
