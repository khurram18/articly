//
//  Article.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation

struct Article {
  
let abstract: String
let webUrl: String
let leadParagraph: String
let publishedDate: Date
let uri: String
let image: String?
let largeImage: String?
  
}

extension Article: Equatable {}

extension Article {
  
var hasImage: Bool {
  image != nil
}
  
} // extension Article
