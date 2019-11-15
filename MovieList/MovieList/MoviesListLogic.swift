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
    if event == .viewCreated {
      return .next(model, effects: [.fetchMovies])
    } else {
      return .noChange
    }
  }
}
