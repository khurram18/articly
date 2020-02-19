//
//  Article.swift
//  NetworkClient
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation

public struct ApiArticle {
  
let abstract: String
let webUrl: String
let leadParagraph: String
let publishedDate: Date
let uri: String
  
init(abstract: String, webUrl: String, leadParagraph: String, publishedDate: Date, uri: String) {
  self.abstract = abstract
  self.webUrl = webUrl
  self.leadParagraph = leadParagraph
  self.publishedDate = publishedDate
  self.uri = uri
}
  
} // class Article

extension ApiArticle: Decodable {
enum Keys: String, CodingKey {
  case abstract
  case webUrl = "web_url"
  case leadParagraph = "lead_paragraph"
  case publishedDate = "pub_date"
  case uri
}
public init(from decoder: Decoder) throws {
  let container = try decoder.container(keyedBy: Keys.self)
  let abstract = try container.decode(String.self, forKey: .abstract)
  let webUrl = try container.decode(String.self, forKey: .webUrl)
  let leadParagraph = try container.decode(String.self, forKey: .leadParagraph)
  let publishedDate = try container.decode(Date.self, forKey: .publishedDate)
  let uri = try container.decode(String.self, forKey: .uri)
  self.init(abstract: abstract, webUrl: webUrl, leadParagraph: leadParagraph, publishedDate: publishedDate, uri: uri)
}
} // extension Article
