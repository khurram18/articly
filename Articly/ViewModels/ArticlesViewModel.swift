//
//  ArticlesViewModel.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//
import NetworkClient
import Foundation

final class ArticlesViewModel {
  
let articlesService: ArticleService
  
init(articlesService: ArticleService) {
  self.articlesService = articlesService
}
  
} // class ArticlesViewModel
