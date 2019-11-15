//
//  MovieListEffectTests.swift
//  MovieListTests
//
//  Created by Captain America on 15/11/19.
//  Copyright © 2019 rugmangathan. All rights reserved.
//

import XCTest
import MobiusTest
import Cuckoo
@testable import MovieList

class MovieListEffectTests: XCTestCase {
  func test_fetches_movies_when_effect_is_fetch_movies() {
    // Setup
    let spy = MockSpyableMovieListAction()
      .withEnabledSuperclassSpy()
    let effect = MovieListEffectHandler(spy)

    // Act
    effect.handle(.fetchMovies)

    //Assert
    verify(spy, times(1)).fetchMovies()
  }
}
