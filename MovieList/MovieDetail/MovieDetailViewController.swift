//
//  MovieDetailViewController.swift
//  MovieList
//
//  Created by Captain America on 15/11/19.
//  Copyright © 2019 rugmangathan. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

  private var movieDetail: Card!
  @IBOutlet weak var movieImageView: UIImageView!
  @IBOutlet weak var movieDescriptionLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    setupUI()
  }

  static func instantiate(_ detail: Card) -> MovieDetailViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let detailView = storyboard
      .instantiateViewController(withIdentifier: "MovieDetailViewController")
      as! MovieDetailViewController

    detailView.movieDetail = detail
    return detailView
  }

  private func setupUI() {
    title = movieDetail.content.title
    MovieService().loadImage(movieDetail.content.movieLogo) { image in
      if let image = image {
        self.movieImageView.image = image
      } else {
        self.movieImageView.image = UIImage.init(systemName: "film.fill")
      }
    }

    movieDescriptionLabel.text = movieDetail.content.description
  }
}
