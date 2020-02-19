//
//  ViewController.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

final class ArticlesViewController: UIViewController {

@IBOutlet weak var tableView: UITableView!
  
var viewModel: ArticlesViewModel?
private let searchController = UISearchController(searchResultsController: nil)
private let indicatorView: UIActivityIndicatorView = {
  let view = UIActivityIndicatorView()
  view.style = .large
  return view
}()
private var isLoadingObservation: NSKeyValueObservation?
private var errorMessageObservation: NSKeyValueObservation?
  
override func viewDidLoad() {
  super.viewDidLoad()
  confirgureSearch()
}
override func viewWillAppear(_ animated: Bool) {
  super.viewWillAppear(animated)
  observeViewModel()
}
  
private func confirgureSearch() {
  searchController.obscuresBackgroundDuringPresentation = false
  searchController.searchBar.placeholder = "Search Articles"
  navigationItem.searchController = searchController
  searchController.searchBar.delegate = self
  definesPresentationContext = true
}
  
private func observeViewModel() {
  
  guard let viewModel = viewModel else { return }
  
  isLoadingObservation = viewModel.observe(\ArticlesViewModel.isLoading, options: [.new]) { [weak self] _, change in
    let show = change.newValue ?? false
    self?.showLoadingIndicator(show)
    if !show {
      self?.tableView.reloadData()
    }
  }
  errorMessageObservation = viewModel.observe(\ArticlesViewModel.errorMessage, options: [.new]) { [weak self] _, change in
    if let errorMessage = change.newValue {
      self?.showErrorMessage(errorMessage)
    }
  }
}
  
private func showLoadingIndicator(_ show: Bool) {
  guard let viewModel = viewModel else { return }
  if show {
    if viewModel.articlesArray.isEmpty {
      tableView.tableFooterView = nil
      indicatorView.frame = CGRect(x: 0, y: 50, width: 200, height: 200)
      tableView.tableHeaderView = indicatorView
    } else {
      tableView.tableHeaderView = nil
      indicatorView.frame = CGRect(x: 0, y: -50, width: 200, height: 200)
      tableView.tableFooterView = indicatorView
    }
    indicatorView.startAnimating()
  } else {
    indicatorView.stopAnimating()
  }
}
private func showErrorMessage(_ errorMessage: String) {
  print(errorMessage)
}
}
