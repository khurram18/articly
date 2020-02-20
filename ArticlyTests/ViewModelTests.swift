//
//  ViewModelTests.swift
//  ArticlyTests
//
//  Created by Khurram on 20/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import XCTest
@testable import Articly

final class ViewModelTests: XCTestCase {

private let mockArticleService = MockArticleService()

private var sut: ArticlesViewModel?
private var observation: NSKeyValueObservation?
  
override func setUp() {
  sut = ArticlesViewModel(articlesService: mockArticleService, persistenceProvider: MockPersistenceProvider())
}

func testLoadingStart() {
  let exp = defaultExpectation()
  mockArticleService.shouldProvideError = false
  observation = sut?.observe(\ArticlesViewModel.isLoading, options: [.new]) { _, change in
    let show = change.newValue ?? false
    if show {
      exp.fulfill()
    }
  }
  sut?.search(query: "123")
  wait(for: [exp], timeout: 1)
}
  
func testLoadingEnd() {
  let exp = defaultExpectation()
  mockArticleService.shouldProvideError = false
  observation = sut?.observe(\ArticlesViewModel.isLoading, options: [.new]) { _, change in
    let show = change.newValue ?? false
    if (self.sut?.articlesArray) != nil {
      if !show {
        exp.fulfill()
      }
    }
  }
  sut?.search(query: "123")
  wait(for: [exp], timeout: 1)
}
func testErrorMessage() {
  let exp = defaultExpectation()
  mockArticleService.shouldProvideError = true
  observation = sut?.observe(\ArticlesViewModel.userMessage, options: [.new]) { _, change in
    if let errorEessage = change.newValue,
      !errorEessage.isEmpty {
      exp.fulfill()
    }
  }
  sut?.search(query: "123")
  wait(for: [exp], timeout: 1)
}
func testSearch() {
  let exp = defaultExpectation()
  mockArticleService.shouldProvideError = false
  observation = sut?.observe(\ArticlesViewModel.isLoading, options: [.new]) { _, change in
    let show = change.newValue ?? false
    if !show,
      let array = self.sut?.articlesArray,
      !array.isEmpty {
      exp.fulfill()
    }
  }
  sut?.search(query: "123")
  wait(for: [exp], timeout: 1)
}
  
func testLoadMore() {
  let exp = defaultExpectation()
  mockArticleService.shouldProvideError = false
  var searchCalled = 1
  observation = sut?.observe(\ArticlesViewModel.isLoading, options: [.new]) { _, change in
    let show = change.newValue ?? false
    if !show {
      if let array = self.sut?.articlesArray,
        !array.isEmpty {
        if searchCalled == 1 {
          self.sut?.search(query: "123")
          searchCalled += 1
        } else if searchCalled == 2 {
          exp.fulfill()
        }
      }
    }
  }
  sut?.search(query: "123")
  wait(for: [exp], timeout: 1)
}
  
func testArticleSelected() {
  let exp = defaultExpectation()
  mockArticleService.shouldProvideError = false
  var article: Article?
  sut?.onArticleSelected = { selectedArticle in
    if article == selectedArticle {
      exp.fulfill()
    }
  }
  observation = sut?.observe(\ArticlesViewModel.isLoading, options: [.new]) { _, change in
    let show = change.newValue ?? false
    if !show,
      let array = self.sut?.articlesArray,
      !array.isEmpty {
      article = array.first
      self.sut?.onSelected(at: 0)
    }
  }
  sut?.search(query: "123")
  wait(for: [exp], timeout: 1)
}
  
} // class ViewModelTests
