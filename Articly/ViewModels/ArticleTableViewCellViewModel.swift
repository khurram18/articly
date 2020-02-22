//
//  ArticleTableViewCellViewModel.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation

struct ArticleTableViewCellViewModel {
  
let title: String
let publishedDate: String
let image: String?
  
init(title: String, publishedDate: Date, image: String?) {
  self.title = title
  self.publishedDate = cellDateFormatter().string(from: publishedDate)
  self.image = image
}
  
} // struct ArticleTableViewCellViewModel

private func cellDateFormatter() -> DateFormatter {
  let formatter = DateFormatter()
  formatter.dateStyle = .short
  formatter.timeStyle = .short
  return formatter
}
