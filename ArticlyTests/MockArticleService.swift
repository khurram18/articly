//
//  MockArticleService.swift
//  ArticlyTests
//
//  Created by Khurram on 20/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import NetworkClient
import Foundation

final class MockArticleService: ArticleService {
  
private let searchResponse = SearchResponse(articles: [
  ApiArticle(abstract: "", webUrl: "", leadParagraph: "", publishedDate: Date(), uri: "", multimedia: [Multimedia(subtype: "", url: "", height: 0, width: 0)])
], meta: Meta(hits: 10, offset: 0))
  
var shouldProvideError = false
  
func search(query: String, page: Int, completion: @escaping (Result<SearchResponse, Error>) -> Void) {
  DispatchQueue.main.async {
    if self.shouldProvideError {
      completion(.failure(NSError(domain: "", code: 1, userInfo: nil)))
    } else {
      completion(.success(self.searchResponse))
    }
  }
}
  
}
