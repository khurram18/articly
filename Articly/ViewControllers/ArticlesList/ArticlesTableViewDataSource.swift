//
//  ArticlesTableViewDataSource.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

final class ArticlesTableViewDataSource: NSObject, UITableViewDataSource {
  
private weak var viewModel: ArticlesViewModel?
  
init(viewModel: ArticlesViewModel) {
  self.viewModel = viewModel
}
  
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  viewModel?.articlesArray.count ?? 0
}
  
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
  guard let viewModel = viewModel else {
    fatalError("viewModel is nil")
  }
  let cell: UITableViewCell
  let article = viewModel.articlesArray[indexPath.row]
  if article.hasImage {
    let imageCell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath)
    (imageCell as? ArticleTableViewCell)?.configure(viewModel.articlesArray[indexPath.row].toCellViewModel())
    cell = imageCell
  } else {
    let simpleCell = tableView.dequeueReusableCell(withIdentifier: SimpleArticleTableViewCell.identifier, for: indexPath)
    (simpleCell as? SimpleArticleTableViewCell)?.configure(viewModel.articlesArray[indexPath.row].toCellViewModel())
    cell = simpleCell
  }
  return cell
}
  
} // class ArticlesTableViewDataSource
