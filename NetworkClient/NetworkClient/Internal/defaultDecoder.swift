//
//  defaultDecoder.swift
//  NetworkClient
//
//  Created by Khurram on 23/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation

let defaultDecoder: JSONDecoder = {
  let decoder = JSONDecoder()
  let formatter = DateFormatter()
  formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
  decoder.dateDecodingStrategy = .formatted(formatter)
  return decoder
}()
