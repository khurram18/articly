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
  
var heading: String {
  article.abstract
}
  
init(article: Article) {
  self.article = article
}
  
} // class ArticleViewModel
