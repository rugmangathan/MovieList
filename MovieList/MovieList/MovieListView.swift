//
//  MovieListView.swift
//  MovieList
//
//  Created by Captain America on 15/11/19.
//  Copyright © 2019 rugmangathan. All rights reserved.
//

import Foundation

protocol MovieListView {
  func showSpinner()
  func showMovies(_ movie: Movie)
  func showFailedState(_ message: String)
}
