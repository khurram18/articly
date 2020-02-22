//
//  Article+ViewModel.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation

extension Article {
  
func toCellViewModel() -> ArticleTableViewCellViewModel {
  ArticleTableViewCellViewModel(title: headline, publishedDate: publishedDate, image: image)
}
  
} // extension Article
