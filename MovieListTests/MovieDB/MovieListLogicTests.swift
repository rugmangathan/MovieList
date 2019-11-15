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
  private let spec = UpdateSpec<MovieListLoopTypes>(MovieListLogic.update)
  private lazy var inFlightState: MovieListModel = {
    MovieListModel(.inFlight)
  }()

  func test_show_spinner_when_view_is_initiated() {
    spec
      .given(inFlightState)
      .when(MovieListEvent.viewCreated)
      .then(
        assertThatNext(
          hasModel(inFlightState),
          hasEffects([.fetchMovies])
        )
    )
  }

  func test_should_show_movie_list_when_fetching_movie_is_successful() {
    let movies = [Movie()]
    spec
      .given(inFlightState)
      .when(MovieListEvent.fetchSuccessful(movies))
      .then(
        assertThatNext(
          hasModel(MovieListModel(.fetchSuccessful, movies)),
          hasNoEffects()
        )
    )
  }

  func test_should_show_no_records_when_fetch_failed() {
    spec
      .given(inFlightState)
      .when(MovieListEvent.fetchFailed)
      .then(
        assertThatNext(
          hasModel(MovieListModel(.fetchFailed)),
          hasNoEffects()
        )
    )
  }
}
