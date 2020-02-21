//
//  ArticlesViewController+UITableViewDelegate.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

extension ArticlesViewController: UITableViewDelegate {
  
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  viewModel?.onSelected(at: indexPath.row)
}
  
} // extension ArticlesViewController
