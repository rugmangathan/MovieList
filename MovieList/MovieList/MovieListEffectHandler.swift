//
//  MovieListEffectHandler.swift
//  MovieList
//
//  Created by Captain America on 15/11/19.
//  Copyright © 2019 rugmangathan. All rights reserved.
//

import MobiusExtras

class MovieListEffectHandler: ConnectableClass<MovieListEffect, MovieListEvent> {
  let movieListAction: MovieListAction

  init(_ movieListAction: MovieListAction) {
    self.movieListAction = movieListAction
  }

  override func handle(_ input: MovieListEffect) {
    switch input {
      case .fetchMovies:
        movieListAction.fetchMovies()
    }
  }
}
