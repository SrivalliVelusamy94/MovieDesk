//
//  MockTestData.swift
//  MovieDesk
//
//  Created by Srivalli Velusamy on 12/06/21.
//

import Foundation

class MockTestData  {
    func getSampleTrendingData() -> Movie {
        let sampleData: [String: Any] = ["id": 84958, "original_name": "Loki", "overview": "After stealing the Tesseract during the events of “Avengers: Endgame,” an alternate version of Loki is brought to the mysterious Time Variance Authority, a bureaucratic organization that exists outside of time and space and monitors the timeline. They give Loki a choice: face being erased from existence due to being a “time variant”or help fix the timeline and stop a greater threat.", "vote_average": 8.199999999999999, "first_air_date": "2021-06-09", "poster_path": "/kEl2t3OhXc3Zb9FBh1AuYzRTgZp.jpg"]
        let mockTrendingObj = Movie(data: sampleData, type: .trending)
        return mockTrendingObj
    }
    
    func getSamplePopularData() -> Movie {
        let sampleData: [String: Any] = ["id": 637649, "original_name": "", "overview": "A cold and mysterious new security guard for a Los Angeles cash truck company surprises his co-workers when he unleashes precision skills during a heist. The crew is left wondering who he is and where he came from. Soon, the marksman's ultimate motive becomes clear as he takes dramatic and irrevocable steps to settle a score.", "vote_average": 7.9, "release_date": "2021-04-22", "poster_path": "/M7SUK85sKjaStg4TKhlAVyGlz3.jpg", "title": "Wrath of Man"]
        let mockPopularObj = Movie(data: sampleData, type: .popular)
        return mockPopularObj
    }
}
