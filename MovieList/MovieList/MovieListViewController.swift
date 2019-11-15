//
//  MovieListViewController.swift
//  MovieList
//
//  Created by Captain America on 15/11/19.
//  Copyright © 2019 rugmangathan. All rights reserved.
//

import UIKit
import MobiusCore

class MovieListViewController: UIViewController {

  private lazy var effectHandler: MovieListEffectHandler = {
    MovieListEffectHandler(self)
  }()

  private lazy var loop: MobiusLoop<MovieListLoopTypes> = {
    Mobius
      .loop(update: MovieListLogic.update, effectHandler: effectHandler)
      .start(from: MovieListModel(.inFlight))
  }()

  private lazy var renderer: MovieListViewRenderer = {
    MovieListViewRenderer(self)
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    loop.addObserver { model in
      DispatchQueue.main.async {
        self.renderer.render(model)
      }
    }
  }
}

extension MovieListViewController: MovieListAction {
  func fetchMovies() {

  }
}

extension MovieListViewController: MovieListView {
  func showSpinner() {

  }

  func showMovies(_ movie: Movie) {

  }

  func showFailedState(_ message: String) {

  }


}

