//
//  MovieListLogicTests.swift
//  MovieListTests
//
//  Created by Captain America on 15/11/19.
//  Copyright © 2019 rugmangathan. All rights reserved.
//

import XCTest
import MobiusTest
@testable import MovieList

class MovieListLogicTests: XCTestCase {
  func test_show_spinner_when_view_is_initiated() {
    let spec = UpdateSpec<MovieListLoopTypes>(MovieListLogic.update)
    spec
      .given(MovieListModel(FetchEvent.inFlight))
      .when(MovieListEvent.viewCreated)
      .then(
        assertThatNext(
          hasModel(MovieListModel(.inFlight)),
          hasEffects([.fetchMovies])
        )
    )
  }
}
