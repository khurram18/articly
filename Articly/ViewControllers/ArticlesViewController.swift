//
//  ViewController.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

final class ArticlesViewController: UIViewController {

var viewModel: ArticlesViewModel?
private let searchController = UISearchController(searchResultsController: nil)
  
override func viewDidLoad() {
  super.viewDidLoad()
  confirgureSearch()
}
  
private func confirgureSearch() {
  searchController.obscuresBackgroundDuringPresentation = false
  searchController.searchBar.placeholder = "Search Articles"
  navigationItem.searchController = searchController
  searchController.searchBar.delegate = self
  definesPresentationContext = true
}
}

extension ArticlesViewController: UISearchBarDelegate {
func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
  
}
}
