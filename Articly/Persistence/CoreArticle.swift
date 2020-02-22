//
//  CoreArticle.swift
//  Articly
//
//  Created by Khurram on 23/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import CoreData
import Foundation

extension CoreArticle {
  
func toArticle() -> Article {
  Article(headline: headline ?? "", abstract: abstract ?? "", webUrl: webUrl ?? "", leadParagraph: leadParagraph ?? "", publishedDate: publishedDate ?? Date(), uri: uri ?? "", image: image, largeImage: largeImage)
}
  
static func newInstance(context: NSManagedObjectContext) -> CoreArticle {
  let coreArticle = NSEntityDescription.insertNewObject(forEntityName: "CoreArticle", into: context) as! CoreArticle
  coreArticle.createdAt = Date()
  return coreArticle
}
  
} // extension CoreArticle
