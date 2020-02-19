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
      let result: Result<SearchResponse, Error>
      if let error = error {
        result = .failure(error)
      } else if let data = data {
        do {
          let serverResponse = try JSONDecoder.defaultDecoder.decode(ServerResponse.self, from: data)
          result = .success(SearchResponse(articles: serverResponse.response.docs, meta: serverResponse.response.meta))
        } catch {
          result = .failure(error)
        }
      } else {
        result = .failure(NetworkError.noData)
      }
      DispatchQueue.main.async {
        completion(result)
      }
    }
    task.resume()
    tasks.insert(task)
  } catch {
    completion(.failure(error))
  }
}
  
} // class RestArticleService
