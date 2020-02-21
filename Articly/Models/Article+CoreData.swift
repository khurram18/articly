//
//  Article+CoreData.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import CoreData
import Foundation

extension Article {
func updateTo(_ coreArticle: CoreArticle) {
  
  coreArticle.headline = headline
  coreArticle.abstract = abstract
  coreArticle.leadParagraph = leadParagraph
  coreArticle.publishedDate = publishedDate
  coreArticle.uri = uri
  coreArticle.webUrl = webUrl
  coreArticle.image = image
  coreArticle.largeImage = largeImage
}
}
