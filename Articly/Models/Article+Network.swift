//
//  Article+Network.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import NetworkClient
import Foundation

extension ApiArticle {
func toArticle() -> Article {
  Article(abstract: abstract, webUrl: webUrl, leadParagraph: leadParagraph, publishedDate: publishedDate, uri: uri)
}
}
