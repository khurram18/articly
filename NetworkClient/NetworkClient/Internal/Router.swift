//
//  Router.swift
//  NetworkClient
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation

enum Router {
  
case searchArticles(query: String, pageNumber: Int)
  
} // enum Router

extension Router {
func urlRequest() throws -> URLRequest {
  guard var components = URLComponents(string: baseApiUrl + path) else {
    throw NetworkError.urlCreation
  }
  var queryItems = [URLQueryItem(name: QueryItem.apiKey.rawValue, value: apiKey)]
  switch self {
  case .searchArticles(let query, let pageNumber):
    queryItems.append(contentsOf: [URLQueryItem(name: QueryItem.query.rawValue, value: query),
                                   URLQueryItem(name: QueryItem.page.rawValue, value: String(describing: pageNumber))])
  }
  components.queryItems = queryItems
  guard let url = components.url else {
    throw NetworkError.urlCreation
  }
  return URLRequest(url: url)
}
  
} // extension Router

extension Router {
var path: String {
  switch self {
  case .searchArticles:
    return "articlesearch.json"
  }
}
  
} // extension Router
