//
//  CoreDataPersistence.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import CoreData
import Foundation

final class CoreDataPersistence: PersistenceProvider {
  
private let persistentContainer: NSPersistentContainer
private let dispatchQueue = DispatchQueue(label: "com.example.Articly.CoreDataPersistence.DispatchQueue")

init(persistentContainer: NSPersistentContainer) {
  self.persistentContainer = persistentContainer
}
  
func persist(articles: [Article], completion: @escaping (Bool) -> Void) {
  let context = persistentContainer.newBackgroundContext()
  dispatchQueue.async {
    var success = false
    for article in articles {
      let coreArticle = self.getCore(from: article, context: context) ?? CoreArticle.newInstance(context: context)
      article.updateTo(coreArticle)
    }
    do {
      try context.save()
      success = true
    } catch {
      print(error)
      success = false
    }
    DispatchQueue.main.async {
      completion(success)
    }
  }
}
  
func getPersisted(recentFirst: Bool) -> [Article]? {
  let fetchRequest: NSFetchRequest<CoreArticle> = CoreArticle.fetchRequest()
  fetchRequest.sortDescriptors = [NSSortDescriptor(key: "publishedDate", ascending: !recentFirst)]
  do {
    return try persistentContainer.viewContext.fetch(fetchRequest).map{ $0.toArticle() }
  } catch {
    print(error)
  }
  return nil
}
func delete(article: Article, completion: @escaping (Bool) -> Void) {
  let context = persistentContainer.newBackgroundContext()
  dispatchQueue.async {
    var success = true
    if let coreArticle = self.getCore(from: article, context: context) {
      context.delete(coreArticle)
      do {
        try context.save()
      } catch {
        print(error)
        success = false
      }
    }
    DispatchQueue.main.async {
      completion(success)
    }
  }
}
func deleteOlder(then date: Date) {
  let fetchRequest: NSFetchRequest<CoreArticle> = CoreArticle.fetchRequest()
  fetchRequest.predicate = NSPredicate(format: "createdAt < %@", date as CVarArg)
  do {
    let context = persistentContainer.viewContext
    let articles = try context.fetch(fetchRequest)
    for article in articles {
      context.delete(article)
    }
    try context.save()
  } catch {
    print(error)
  }
}
  
private func getCore(from article: Article, context: NSManagedObjectContext) -> CoreArticle? {
  let fetchRequest: NSFetchRequest<CoreArticle> = CoreArticle.fetchRequest()
  fetchRequest.predicate = NSPredicate(format: "uri LIKE[c] %@", article.uri)
  do {
    return try context.fetch(fetchRequest).first
  } catch {
    print(error)
  }
  return nil
}
  
} // class CoreDataPersistence
