//
//  NetworkClientTests.swift
//  NetworkClientTests
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import XCTest
@testable import NetworkClient

final class NetworkClientTests: XCTestCase {
var articleService: RestArticleService?
  
override func setUp() {
  articleService = RestArticleService()
}

func testGetArticless() {
  let exp = defaultExpectation()
  articleService?.search(query: "Ocean", page: 1) { result in
    switch result {
    case .success(let articles):
      print(articles)
      exp.fulfill()
    case .failure(let error):
      print(error)
    }
  }
  wait(for: [exp], timeout: 10.0)
}

}
