//
//  MockPersistenceProvider.swift
//  ArticlyTests
//
//  Created by Khurram on 20/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

@testable import Articly
import Foundation

final class MockPersistenceProvider: PersistenceProvider {
  
var shouldPersist = false
var shouldReturnPersisted = false
var shouldDelete = false
  
private var articles = [Article]()
  
func persist(articles: [Article], completion: @escaping (Bool) -> Void) {
  self.articles = articles
  DispatchQueue.main.async {
    completion(self.shouldPersist)
  }
}

func getPersisted(recentFirst: Bool) -> [Article]? {
  if shouldReturnPersisted {
    return articles
  } else {
    return nil
  }
}

func delete(article: Article, completion: @escaping (Bool) -> Void) {
  DispatchQueue.main.async {
    completion(self.shouldDelete)
  }
}
func deleteOlder(then date: Date) {
  
}
}
