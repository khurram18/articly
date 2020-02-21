//
//  ArticlesViewController+UITableViewDataSourcePrefetching.swift
//  Articly
//
//  Created by Khurram on 21/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

/// If user has scrolled past 75% rows then we will fetch next articles
private let threshold: Float = 0.75

extension ArticlesViewController: UITableViewDataSourcePrefetching {
  
func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
  guard let viewModel = viewModel else { return }
  for indexPath in indexPaths {
    if (Float(indexPath.row) / Float(viewModel.articlesArray.count)) >= threshold {
      viewModel.loadNextPage()
    }
  }
}
} // extension ArticlesViewController
