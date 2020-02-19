//
//  File.swift
//  NetworkClient
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation

public struct Meta: Decodable {
public let hits: Int
public let offset: Int
public init(hits: Int, offset: Int) {
  self.hits = hits
  self.offset = offset
}
}
