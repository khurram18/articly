//
//  PersistenceTests.swift
//  ArticlyTests
//
//  Created by Khurram on 20/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import CoreData
import XCTest
@testable import Articly

final class PersistenceTests: XCTestCase {

private var sut: CoreDataPersistence?
  
//MARK: mock in-memory persistant store
private lazy var managedObjectModel: NSManagedObjectModel = {
    let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle(for: type(of: self))] )!
    return managedObjectModel
}()

private lazy var mockPersistantContainer: NSPersistentContainer = {
    
    let container = NSPersistentContainer(name: "Articly", managedObjectModel: self.managedObjectModel)
    let description = NSPersistentStoreDescription()
    description.type = NSInMemoryStoreType
    description.shouldAddStoreAsynchronously = false // Make it simpler in test env
    
    container.persistentStoreDescriptions = [description]
    container.loadPersistentStores { (description, error) in
        // Check if the data store is in memory
        precondition( description.type == NSInMemoryStoreType )

        // Check if creating container wrong
        if let error = error {
            fatalError("Create an in-mem coordinator failed \(error)")
        }
    }
    return container
}()
  
override func setUp() {
  sut = CoreDataPersistence(persistentContainer: mockPersistantContainer)
}

func testSave() {
  let exp = defaultExpectation()
  sut?.persist(articles: [Article(headline: "", abstract: "", webUrl: "", leadParagraph: "", publishedDate: Date(), uri: "1", image: nil, largeImage: nil)]) { success in
    if success {
      exp.fulfill()
    }
  }
  wait(for: [exp], timeout: 3)
}
  
func testRetrive() {
  let exp = defaultExpectation()
  let article = Article(headline: "", abstract: "", webUrl: "", leadParagraph: "", publishedDate: Date(), uri: "1", image: nil, largeImage: nil)
  sut?.persist(articles: [article], completion: { _ in
    let persisted = self.sut?.getPersisted(recentFirst: true)
    let success = persisted != nil && persisted!.count == 1 && persisted![0] == article
    if success {
      exp.fulfill()
    }
  })
  wait(for: [exp], timeout: 3)
}
func testUpdate() {
  let exp = defaultExpectation()
  let article = Article(headline: "", abstract: "", webUrl: "", leadParagraph: "", publishedDate: Date(), uri: "1", image: nil, largeImage: nil)
  sut?.persist(articles: [article], completion: { _ in
    let updatedArticle = Article(headline: "", abstract: "123", webUrl: "", leadParagraph: "", publishedDate: Date(), uri: "1", image: nil, largeImage: nil)
    self.sut?.persist(articles: [updatedArticle]) { _ in
      let persisted = self.sut?.getPersisted(recentFirst: true)
      let success = persisted != nil && persisted!.count == 1 && persisted![0].abstract == "123"
      if success {
        exp.fulfill()
      }
    }
  })
  wait(for: [exp], timeout: 3)
}
func testDelete() {
  let exp = defaultExpectation()
  let article = Article(headline: "", abstract: "", webUrl: "", leadParagraph: "", publishedDate: Date(), uri: "1", image: nil, largeImage: nil)
  sut?.persist(articles: [article]) { persistSuccess in
    if persistSuccess {
      self.sut?.delete(article: article) { deleteSuccess in
        if deleteSuccess {
          let persisted = self.sut?.getPersisted(recentFirst: true)
          let success = persisted == nil || persisted?.count == 0
          if success {
            exp.fulfill()
          }
        }
      }
    }
  }
  wait(for: [exp], timeout: 3)
}
  
func testPastDelete() {
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = "dd/MM/yyyy"
  
  let date = dateFormatter.date(from: "10/03/2020")!
  
  let article = Article(headline: "", abstract: "", webUrl: "", leadParagraph: "", publishedDate: Date(), uri: "1", image: nil, largeImage: nil)
  
  let exp = defaultExpectation()
  
  sut?.persist(articles: [article]) { success in
    if success {
      self.sut?.deleteOlder(then: date)
      let persisted = self.sut?.getPersisted(recentFirst: true)
      if persisted == nil || persisted?.count == 0 {
        exp.fulfill()
      }
    }
  }
  wait(for: [exp], timeout: 3)
}
  
} // class PersistenceTests
