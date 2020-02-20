//
//  ArticleTableViewCellViewModel.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation

struct ArticleTableViewCellViewModel {
  
static var dateFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateStyle = .short
  formatter.timeStyle = .short
  return formatter
}()
  
let abstract: String
let publishedDate: String
let image: String?
  
init(abstract: String, publishedDate: Date, image: String?) {
  self.abstract = abstract
  self.publishedDate = ArticleTableViewCellViewModel.dateFormatter.string(from: publishedDate)
  self.image = image
}
  
}
