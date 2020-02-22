//
//  Article.swift
//  NetworkClient
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation

public struct ApiArticle {
  
public let abstract: String
public let webUrl: String
public let leadParagraph: String
public let publishedDate: Date
public let uri: String
public let multimedia: [Multimedia]
public let headline: Headline
  
public init(abstract: String, webUrl: String, leadParagraph: String, publishedDate: Date, uri: String, multimedia: [Multimedia], headline: Headline) {
  self.abstract = abstract
  self.webUrl = webUrl
  self.leadParagraph = leadParagraph
  self.publishedDate = publishedDate
  self.uri = uri
  self.multimedia = multimedia
  self.headline = headline
}
  
} // class Article

extension ApiArticle: Decodable {
  
enum Keys: String, CodingKey {
  case abstract
  case webUrl = "web_url"
  case leadParagraph = "lead_paragraph"
  case publishedDate = "pub_date"
  case uri
  case multimedia
  case headline
}
public init(from decoder: Decoder) throws {
  let container = try decoder.container(keyedBy: Keys.self)
  let abstract = try container.decode(String.self, forKey: .abstract)
  let webUrl = try container.decode(String.self, forKey: .webUrl)
  let leadParagraph = try container.decode(String.self, forKey: .leadParagraph)
  let publishedDate = try container.decode(Date.self, forKey: .publishedDate)
  let uri = try container.decode(String.self, forKey: .uri)
  let multimedia = try container.decode([Multimedia].self, forKey: .multimedia)
  let headline = try container.decode(Headline.self, forKey: .headline)
  self.init(abstract: abstract, webUrl: webUrl, leadParagraph: leadParagraph, publishedDate: publishedDate, uri: uri, multimedia: multimedia, headline: headline)
}
} // extension Article
