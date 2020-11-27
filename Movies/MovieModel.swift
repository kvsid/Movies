//
//  MovieModel.swift
//  Movies
//
//  Created by Xenia Sidorova on 27.11.2020.
//

import Foundation
class MovieModel {

    struct Movie: Decodable {
        let original_title: String
        let poster_path: String
        let release_date: String // Date??
        let overview: String
    }

    struct Movies: Decodable {
        var results: [Movie]
    }

    public func movies() -> [Movie] {
        var movies: [Movie] = []
        
        let data = rawData().data(using: .utf8)

        if let data = data,
           let jsonMovies = try? JSONDecoder().decode(Movies.self, from: data) {
            movies = jsonMovies.results
        }
        return movies
    }
    
    private func rawData() -> String {
        return """
        {
          "total_results": 10000,
          "page": 2,
          "total_pages": 500,
          "results": [
            {
              "original_title": "Come Play",
              "poster_path": "/e98dJUitAoKLwmzjQ0Yxp1VQrnU.jpg",
              "video": false,
              "vote_average": 6.8,
              "overview": "A lonely young boy feels different from everyone else. Desperate for a friend, he seeks solace and refuge in his ever-present cell phone and tablet. When a mysterious creature uses the boy’s devices against him to break into our world, his parents must fight to save their son from the monster beyond the screen.",
              "release_date": "2020-10-28",
              "title": "Come Play",
              "popularity": 455.514,
              "adult": false,
              "backdrop_path": "/gkvOmVXdukAwpG8LjTaHo2l2cWU.jpg",
              "id": 571384,
              "genre_ids": [
                27
              ],
              "vote_count": 71,
              "original_language": "en"
            }
          ]
        }
        """
    }
}
