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
  
private let dispatchQueue = DispatchQueue(label: "com.example.Articly.DispatchQueue")
  
func persist(articles: [Article]) {
  dispatchQueue.async {
    let context = AppDelegate.instance.persistentContainer.newBackgroundContext()
    for article in articles {
      let fetchRequest: NSFetchRequest<CoreArticle> = CoreArticle.fetchRequest()
      fetchRequest.predicate = NSPredicate(format: "uri LIKE[c] %@", article.uri)
      do {
        let result = try context.fetch(fetchRequest)
        let coreArticle = result.first ?? NSEntityDescription.insertNewObject(forEntityName: "CoreArticle", into: context) as! CoreArticle
        article.updateTo(coreArticle)
      } catch {
        print(error)
      }
    }
    do {
      try context.save()
    } catch {
      print(error)
    }
  }
}
  
}
