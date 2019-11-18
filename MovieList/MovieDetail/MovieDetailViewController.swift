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
  
  override func viewDidLoad() {
    super.viewDidLoad()

    title = movieDetail.content.title
  }

  static func instantiate(_ detail: Card) -> MovieDetailViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let detailView = storyboard
      .instantiateViewController(withIdentifier: "MovieDetailViewController")
      as! MovieDetailViewController

    detailView.movieDetail = detail
    return detailView
  }
}
