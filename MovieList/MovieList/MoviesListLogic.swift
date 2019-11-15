//
//  MoviesListLogic.swift
//  MovieList
//
//  Created by Captain America on 15/11/19.
//  Copyright © 2019 rugmangathan. All rights reserved.
//

import MobiusCore

class MovieListLogic {
  static func update(_ model: MovieListModel, _ event: MovieListEvent) -> Next<MovieListModel, MovieListEffect> {
    switch event {
      case .viewCreated:
        return .next(model, effects: [.fetchMovies])
      case .fetchSuccessful(let movies):
        return .next(MovieListModel(.fetchSuccessful, movies))
      case .fetchFailed:
        return .next(MovieListModel(.fetchFailed))
    }
  }
}
