//
//  MovieListViewRenderer.swift
//  MovieList
//
//  Created by Captain America on 15/11/19.
//  Copyright © 2019 rugmangathan. All rights reserved.
//

import Foundation

class MovieListViewRenderer {
  private let view: MovieListView

  init(_ view: MovieListView) {
    self.view = view
  }

  func render(_ model: MovieListModel) {
    switch model.fetchEvent {
      case .inFlight:
        view.showSpinner()
      case .fetchSuccessful:
        if let movie = model.result {
          view.showMovies(movie)
        } else {
          view.showFailedState("")
        }
      case .fetchFailed:
        view.showFailedState("")
    }
  }
}
