//
//  PersistenceProvider.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation

protocol PersistenceProvider {
  
func persist(articles: [Article], completion: @escaping (Bool) -> Void)
func getPersisted(recentFirst: Bool) -> [Article]?
func delete(article: Article, completion: @escaping (Bool) -> Void)
func deleteOlder(then date: Date)
  
} // protocol PersistenceProvider
