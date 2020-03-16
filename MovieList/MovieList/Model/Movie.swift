//
//  Movie.swift
//  MovieList
//
//  Created by Captain America on 15/11/19.
//  Copyright © 2019 rugmangathan. All rights reserved.
//

import Foundation

struct MovieError: Decodable, Equatable {
  let title: String
  let message: String
}

struct Movie: Decodable, Equatable {
  let data: MovieData
  let success: Bool
  let errors: MovieError
}

// MARK: Extensions
extension Movie {
  static func fakeMovies() -> Movie {
    let actions: [Action] = [
      Action(description: "Submit", deeplink: "iosapp://test")
    ]

    let content: Content = Content(
      title: "El Camino' Cooks Up 'Breaking Bad' Easter Eggs",
      description: "On this spoiler-filled IMDbrief, we break bad and break down the Breaking Bad finale part two: 'El Camino' (2019).",
      movieLogo: "https://m.media-amazon.com/images/M/MV5BMjFjOGEwYjAtNDQxYy00OThhLWI3NDYtYTEyOGRlZDRhN2ViXkEyXkFqcGdeQXRyYW5zY29kZS13b3JrZmxvdw@@._V1_.jpg",
      rating: 8.0,
      actions: actions
    )

    let card: Card = Card(
      cardId: "movie_01",
      startTime: 1544510274,
      endTime: 1544510274,
      priority: 0.99,
      hideOnUse: true,
      hideOnUseForSeconds: 300,
      cardTemplate: "movie_card",
      poiLatLong: "-6.2145983,106.8451283",
      distanceThresholdInMeters: 2000,
      content: content
    )

    return Movie(
      data: MovieData(cards: [card]),
      success: true,
      errors: MovieError(title: "Soemthing went wrong", message: "Some random error")
    )
  }
}
