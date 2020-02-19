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
  
func persist(articles: [Article]) {
  let context = persistentContainer.newBackgroundContext()
  dispatchQueue.async {
    for article in articles {
      let coreArticle = self.getCore(from: article, context: context) ?? NSEntityDescription.insertNewObject(forEntityName: "CoreArticle", into: context) as! CoreArticle
      article.updateTo(coreArticle)
    }
    do {
      try context.save()
    } catch {
      print(error)
    }
  }
}
  
func getCore(from article: Article, context: NSManagedObjectContext) -> CoreArticle? {
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
