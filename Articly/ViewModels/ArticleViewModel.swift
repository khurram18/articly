//
//  ArticleViewModel.swift
//  Articly
//
//  Created by Khurram on 20/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation

final class ArticleViewModel {
  
private let article: Article
private var dateFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateStyle = .long
  formatter.timeStyle = .short
  return formatter
}()
  
var heading: String {
  article.abstract
}
  
var date: String {
  dateFormatter.string(from: article.publishedDate)
}
  
var imageUrl: String? {
  article.largeImage
}
  
var detailText: String {
  article.leadParagraph
}
  
var url: String {
  article.webUrl
}
  
init(article: Article) {
  self.article = article
}
  
} // class ArticleViewModel
