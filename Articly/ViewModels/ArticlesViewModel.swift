//
//  ArticlesViewModel.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//
import NetworkClient
import Foundation

final class ArticlesViewModel: NSObject {
  
private let articlesService: ArticleService
private let persistenceProvider: PersistenceProvider
private var page = 0
private var query = ""
private var meta = Meta(hits: 0, offset: 0)

var onArticleSelected: ((Article) -> Void)?
var articlesArray = [Article]()
@objc dynamic var isLoading = false
@objc dynamic var errorMessage = ""
  
init(articlesService: ArticleService, persistenceProvider: PersistenceProvider) {
  self.articlesService = articlesService
  self.persistenceProvider = persistenceProvider
}
  
func search(query: String) {
  self.query = query
  page = 0
  articlesArray.removeAll()
  performSearch()
}

func loadNextPage() {
  if !hasMore {
    return
  }
  page += 1
  performSearch()
}
func onSelected(at index: Int) {
  onArticleSelected?(articlesArray[index])
}
private var hasMore: Bool {
  // As per documentation here https://developer.nytimes.com/docs/articlesearch-product/1/overview
  // we can get a maxiumum of 100 pages
  meta.offset < meta.hits && page <= 100
}
  
private func performSearch() {
  isLoading = true
  articlesService.search(query: query, page: page) { [weak self] result in
    guard let strongSelf = self else { return }
    switch result {
    case .success(let response):
      strongSelf.meta = response.meta
      let articles = response.articles.map { $0.toArticle() }
      strongSelf.persist(articles)
      strongSelf.articlesArray.append(contentsOf: articles)
    case .failure(let error):
      strongSelf.onError(error)
    }
    strongSelf.isLoading = false
  }
}
  
private func persist(_ articles: [Article]) {
  persistenceProvider.persist(articles: articles)
}
  
private func onError(_ error: Error) {
  guard let networkError = error as? NetworkError else { return }
  errorMessage = networkError.description
}

} // class ArticlesViewModel
