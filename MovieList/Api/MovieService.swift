//
//  MovieService.swift
//  MovieList
//
//  Created by Captain America on 15/11/19.
//  Copyright © 2019 rugmangathan. All rights reserved.
//

import Foundation
import UIKit

enum ApiError: String, Error{
  case invalidUrl
  case noData
}

class MovieService {
  private lazy var baseUrl: String = {
    "https://twhiring-40b28.firebaseapp.com/interview_ios.json"
  }()

  private lazy var configuration: URLSessionConfiguration = {
    URLSessionConfiguration.default
  }()

  private lazy var urlSession: URLSession = {
    URLSession(configuration: configuration)
  }()

  private var dataTask: URLSessionTask?

  func loadImage(_ imageUrl: String, _ completionHandler: @escaping (UIImage?) -> Void) {
    guard let url: URL = URL(string: imageUrl) else {
      completionHandler(nil)
      return
    }

    dataTask = urlSession.dataTask(with: url) { (data, response, error) in
      DispatchQueue.main.async {
        if let data = data {
          completionHandler(UIImage(data: data))
        } else {
          completionHandler(nil)
        }
      }
    }
    dataTask?.resume()
  }
}

// MARK: - Extensions
// MARK: ApiService methods
extension MovieService: ApiService {
  func fetchMovies(_ completionHandler: @escaping (Movie?, Error?) -> Void) {
    guard let url: URL = URL(string: baseUrl) else {
      completionHandler(nil, ApiError.invalidUrl)
      return
    }

    dataTask = urlSession.dataTask(with: url) { (data, response, error) in
      if let validError = error {
        DispatchQueue.main.async {
          completionHandler(nil, validError)
        }
      } else {
        guard let validData = data else {
          DispatchQueue.main.async {
            completionHandler(nil, ApiError.noData)
          }
          return
        }

        let decoder: JSONDecoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
          let movie: Movie = try decoder.decode(Movie.self, from: validData)
          DispatchQueue.main.async {
            completionHandler(movie, nil)
          }
        } catch let decodeError {
          DispatchQueue.main.async {
            completionHandler(nil, decodeError)
          }
        }
      }
    }

    dataTask?.resume()
  }

  func cancel() {
    dataTask?.cancel()
  }
}
