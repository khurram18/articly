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
  
private let articlesService: ArticleService
private let persistenceProvider: PersistenceProvider
private var page = 0
  
init(articlesService: ArticleService, persistenceProvider: PersistenceProvider) {
  self.articlesService = articlesService
  self.persistenceProvider = persistenceProvider
}
  
func search(query: String) {
  articlesService.search(query: query, page: page) { [weak self] result in
    guard let strongSelf = self else { return }
    switch result {
    case .success(let response):
      strongSelf.persist(response.articles)
    case .failure(let error):
      print(error)
    }
  }
}

private func persist(_ articles: [ApiArticle]) {
  persistenceProvider.persist(articles: articles.map { $0.toArticle() })
}

} // class ArticlesViewModel
