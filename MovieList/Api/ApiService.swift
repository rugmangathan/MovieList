//
//  ApiService.swift
//  MovieList
//
//  Created by Captain America on 15/11/19.
//  Copyright © 2019 rugmangathan. All rights reserved.
//

import Foundation

protocol ApiService {
  func fetchMovies(_ completionHandler: @escaping (Movie?, Error?) -> Void)
}
