//
//  ArticlesViewController+UITableViewDelegate.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

private let imageCellHeight: CGFloat = 250
private let simpleCellHeight: CGFloat = 116

extension ArticlesViewController: UITableViewDelegate {
  
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  viewModel?.onSelected(at: indexPath.row)
}
  
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
  guard let viewModel = viewModel else { return 0 }
  return viewModel.articlesArray[indexPath.row].hasImage ? imageCellHeight : simpleCellHeight
}
  
} // extension ArticlesViewController
