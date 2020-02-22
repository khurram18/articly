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
  
private var articleService: RestArticleService?
  
override func setUp() {
  articleService = RestArticleService()
}

func testGetArticles() {
  let exp = defaultExpectation()
  articleService?.search(query: "Ocean", page: 0) { result in
    switch result {
    case .success:
      exp.fulfill()
    case .failure(let error):
      print(error)
    }
  }
  wait(for: [exp], timeout: 20.0)
}

}
