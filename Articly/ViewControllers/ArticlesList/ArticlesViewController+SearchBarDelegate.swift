//
//  ArticlesViewController+SearchBarDelegate.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

extension ArticlesViewController: UISearchBarDelegate {
func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
  viewModel?.search(query: searchBar.text!)
}
}
