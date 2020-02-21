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
private let dispatchQueue = DispatchQueue(label: "com.example.Articly.DispatchQueue")

init(persistentContainer: NSPersistentContainer) {
  self.persistentContainer = persistentContainer
}
  
func persist(articles: [Article], completion: @escaping (Bool) -> Void) {
  let context = persistentContainer.newBackgroundContext()
  dispatchQueue.async {
    var success = false
    for article in articles {
      let coreArticle = self.getCore(from: article, context: context) ?? NSEntityDescription.insertNewObject(forEntityName: "CoreArticle", into: context) as! CoreArticle
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
  
}

extension CoreArticle {
func toArticle() -> Article {
  Article(headline: headline ?? "", abstract: abstract ?? "", webUrl: webUrl ?? "", leadParagraph: leadParagraph ?? "", publishedDate: publishedDate ?? Date(), uri: uri ?? "", image: image, largeImage: largeImage)
}
}
