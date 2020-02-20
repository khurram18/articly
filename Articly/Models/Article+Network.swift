//
//  Article+Network.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import NetworkClient
import Foundation

private let baseUrl = "https://nytimes.com/"

extension ApiArticle {
func toArticle() -> Article {
  Article(abstract: abstract, webUrl: webUrl, leadParagraph: leadParagraph, publishedDate: publishedDate, uri: uri, image: image, largeImage: largeImage)
}
  
// There are several images availabe we will just only two for image and largeImage
  
private var image: String? {
  for media in multimedia {
    if media.subtype == "jumbo" {
      return baseUrl + media.url
    }
  }
  return nil
}
  
private var largeImage: String? {
  for media in multimedia {
    if media.subtype == "superJumbo" {
      return baseUrl + media.url
    }
  }
  return nil
}
}
