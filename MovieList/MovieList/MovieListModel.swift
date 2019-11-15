//
//  MovieListModel.swift
//  MovieList
//
//  Created by Captain America on 15/11/19.
//  Copyright © 2019 rugmangathan. All rights reserved.
//

import Foundation

class MovieListModel {
  let fetchEvent: FetchEvent
  let result: [Movie]?

  init(_ fetchEvent: FetchEvent, _ result: [Movie]? = nil) {
    self.fetchEvent = fetchEvent
    self.result = result
  }
}

extension MovieListModel: Equatable {
  static func == (lhs: MovieListModel, rhs: MovieListModel) -> Bool {
    return lhs.fetchEvent == rhs.fetchEvent
      && lhs.result == rhs.result
  }
}
