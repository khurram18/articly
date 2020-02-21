//
//  ArticlesTableViewDelegate.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

final class ArticlesTableViewDelegate: NSObject, UITableViewDelegate {
  
private let imageCellHeight: CGFloat = 250
private let simpleCellHeight: CGFloat = 116

private weak var viewModel: ArticlesViewModel?
  
init(viewModel: ArticlesViewModel) {
  self.viewModel = viewModel
}
  
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  viewModel?.onSelected(at: indexPath.row)
}
  
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
  guard let viewModel = viewModel else { return 0 }
  return viewModel.articlesArray[indexPath.row].hasImage ? imageCellHeight : simpleCellHeight
}
  
} // class ArticlesTableViewDelegate
