//
//  Multimedia.swift
//  NetworkClient
//
//  Created by Khurram on 20/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation

public struct Multimedia: Decodable {
  
public let subtype: String
public let url: String
public let height: Int
public let width: Int
  
public init(subtype: String, url: String, height: Int, width: Int) {
  self.subtype = subtype
  self.url = url
  self.height = height
  self.width = width
}
  
} // struct Multimedia
