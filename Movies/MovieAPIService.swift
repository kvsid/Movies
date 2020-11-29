//
//  MovieModel.swift
//  Movies
//
//  Created by Xenia Sidorova on 27.11.2020.
//

import Foundation

struct Movie: Decodable {
    let originalTitle: String
    let posterPath: String
    let releaseDate: Date // Date??
    let overview: String
}

struct Movies: Decodable {
    var results: [Movie]
}

class MovieAPIService {
    public static let shared = MovieAPIService()
    private init() {}
    private let urlSession = URLSession.shared
    private let baseURL = URL(string: "https://api.themoviedb.org/3")!
    private let apiKey = "85eb5cf47b27b2865521dc4c0122cde9"
    private let jsonDecoder: JSONDecoder = {
       let jsonDecoder = JSONDecoder()
       jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy-mm-dd"
       jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
       return jsonDecoder
    }()

    enum Endpoint: String, CaseIterable {
//        CustomStringConvertible
        case nowPlaying = "now_playing"
        case upcoming
        case popular
        case topRated = "top_rated"
    }
    
    public enum APIServiceError: Error {
        case apiError
        case invalidEndpoint
        case invalidResponse
        case noData
        case decodeError
    }
    
    public func fetchMovies(from endpoint: Endpoint, result: @escaping (Result<Movies, APIServiceError>) -> Void) {
        let movieURL = baseURL
            .appendingPathComponent("movie")
            .appendingPathComponent(endpoint.rawValue)
        fetchResources(url: movieURL, completion: result)
    }
    
    private func fetchResources<T: Decodable>(url: URL, completion: @escaping (Result<T, APIServiceError>) -> Void) {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        let queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        urlSession.dataTask(with: url) { (result)  in
            switch result {
                case .success(let (response, data)):
                    guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                        completion(.failure(.invalidResponse))
                        return
                    }
                    do {
                        let values = try self.jsonDecoder.decode(T.self, from: data)
                        completion(.success(values))
                    } catch {
                        completion(.failure(.decodeError))
                    }
                case .failure(_):
                    completion(.failure(.apiError))
                }
         }.resume()
    }
}

extension URLSession {
    func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((response, data)))
        }
    }
}
