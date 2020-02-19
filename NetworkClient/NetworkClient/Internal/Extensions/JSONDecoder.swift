//
//  JSONDecoder.swift
//  NetworkClient
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation

extension JSONDecoder {
  static var defaultDecoder: JSONDecoder {
    let decoder = JSONDecoder()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    decoder.dateDecodingStrategy = .formatted(formatter)
    return decoder
  }
}
