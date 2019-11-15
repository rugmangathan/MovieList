//
//  Card.swift
//  MovieList
//
//  Created by Captain America on 15/11/19.
//  Copyright © 2019 rugmangathan. All rights reserved.
//

import Foundation

struct Card: Decodable, Equatable {
  let cardId: String
  let startTime: Int
  let endTime: Int
  let priority: Double
  let hideOnUse: Bool
  let hideOnUseForSeconds: Int
  let cardTemplate: String
  let poiLatLong: String
  let distanceThresholdInMeters: Int
  let content: Content
}
