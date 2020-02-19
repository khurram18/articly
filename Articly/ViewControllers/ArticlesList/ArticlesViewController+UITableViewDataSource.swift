//
//  ArticlesViewController+UITableViewDataSource.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

extension ArticlesViewController: UITableViewDataSource {
  
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  viewModel?.articlesArray.count ?? 0
}
  
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath)
  if let viewModel = viewModel {
    (cell as? ArticleTableViewCell)?.configure(viewModel.articlesArray[indexPath.row].toCellViewModel())
  }
  return cell
}
  
} // extension ArticlesViewController
