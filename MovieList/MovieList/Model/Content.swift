//
//  Content.swift
//  MovieList
//
//  Created by Captain America on 15/11/19.
//  Copyright © 2019 rugmangathan. All rights reserved.
//

import Foundation

struct Content: Decodable, Equatable {
  let title: String
  let description: String
  let movieLogo: String
  let rating: Double
  let actions: [Action]
}
