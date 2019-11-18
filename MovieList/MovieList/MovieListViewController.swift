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
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
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

  private var tableViewOptions: [Card] = []

  override func viewDidLoad() {
    super.viewDidLoad()

    loop.addObserver { model in
      DispatchQueue.main.async {
        self.renderer.render(model)
      }
    }

    loop.dispatchEvent(.viewCreated)

    tableView.tableFooterView = UIView()

  }
}

extension MovieListViewController: MovieListAction {
  func fetchMovies() {
    MovieService().fetchMovies { (movie, error) in
      guard error == nil else {
        self.loop.dispatchEvent(.fetchFailed)
        return
      }

      self.loop.dispatchEvent(.fetchSuccessful(movie))
    }
  }
}

extension MovieListViewController: MovieListView {
  func showSpinner() {
    activityIndicator.startAnimating()
  }

  func showMovies(_ movie: Movie) {
    activityIndicator.stopAnimating()
    tableViewOptions = movie.data.cards
    tableView.reloadData()
  }

  func showFailedState(_ message: String) {
    let alertView = UIAlertController(
      title: "Alert",
      message: "Failed to load data",
      preferredStyle: UIAlertController.Style.alert
    )
    alertView.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default))

    present(alertView, animated: true)
  }
}

extension MovieListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    tableViewOptions.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView
      .dequeueReusableCell(withIdentifier: "MovieListTableViewCell", for: indexPath)
      as! MovieListTableViewCell
    let card = tableViewOptions[indexPath.row]

    cell.movieTitleLabel.text = card.content.title
    MovieService().loadImage(card.content.movieLogo) { image in
      if let image = image {
        cell.movieImageView.image = image
      }
    }

    cell.movieImageView.image = UIImage(systemName: "film.fill")

    return cell
  }
}

extension MovieListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    100.0
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detailView = MovieDetailViewController.instantiate(tableViewOptions[indexPath.row])
    navigationController?.pushViewController(detailView, animated: true)
  }
}
