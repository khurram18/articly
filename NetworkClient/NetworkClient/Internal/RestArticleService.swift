//
//  RestArticleService.swift
//  NetworkClient
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation

final class RestArticleService: ArticleService {
  
private var tasks = Set<URLSessionDataTask>()
  
func search(query: String, page: Int, completion: @escaping (Result<SearchResponse, Error>) -> Void) {
  do {
    let request = try Router.searchArticles(query: query, pageNumber: page).urlRequest()
    let task = URLSession.shared.dataTask(with: request) {data, response, error in
      if let error = error {
        completion(.failure(error))
        return
      }
      guard let data = data else {
        completion(.failure(NetworkError.noData))
        return
      }
      do {
        let serverResponse = try JSONDecoder.defaultDecoder.decode(ServerResponse.self, from: data)
        completion(.success(SearchResponse(articles: serverResponse.response.docs, meta: serverResponse.response.meta)))
      } catch {
        completion(.failure(error))
      }
    }
    task.resume()
    tasks.insert(task)
  } catch {
    completion(.failure(error))
  }
}
  
} // class RestArticleService
