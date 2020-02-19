//
//  ArticleService.swift
//  NetworkClient
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation

public protocol ArticleService {
func search(query: String, page: Int, completion: @escaping (Result<SearchResponse, Error>) -> Void)
  
}
