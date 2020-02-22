//
//  ViewController.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

final class ArticlesViewController: UIViewController {

@IBOutlet weak var messageViewTopConstraint: NSLayoutConstraint!
@IBOutlet weak var tableViewTopConstraint: NSLayoutConstraint!
@IBOutlet weak var tableView: UITableView!
@IBOutlet weak var messageLabel: UILabel!
@IBOutlet weak var messageView: UIView!
  
var viewModel: ArticlesViewModel?
var searchBarDelegate: UISearchBarDelegate?
var tableViewDataSource: UITableViewDataSource?
var tableViewDelegate: UITableViewDelegate?
var tableViewDataSourcePrefetching: UITableViewDataSourcePrefetching?
  
private let searchController = UISearchController(searchResultsController: nil)
  
private let indicatorView: UIActivityIndicatorView = {
  let view = UIActivityIndicatorView()
  view.style = .large
  return view
}()
  
private let emptyView: UIView = {
  let label = UILabel()
  label.text = "Please use search bar to search for articles."
  label.textAlignment = .center
  label.numberOfLines = 2
  label.font = UIFont.preferredFont(forTextStyle: .title1)
  return label
}()
  
private var isLoadingObservation: NSKeyValueObservation?
private var userMessageObservation: NSKeyValueObservation?
  
override func viewDidLoad() {
  super.viewDidLoad()
  confirgureSearch()
  configureTableView()
}
  
override func viewDidAppear(_ animated: Bool) {
  super.viewDidAppear(animated)
  observeViewModel()
  checkEmptyTableView()
}
  
override func viewWillDisappear(_ animated: Bool) {
  super.viewWillDisappear(animated)
  removeObservers()
}
  
} // class ArticlesViewController

extension ArticlesViewController {
  
private func confirgureSearch() {
  searchController.obscuresBackgroundDuringPresentation = false
  searchController.searchBar.placeholder = "Search Articles"
  navigationItem.searchController = searchController
  searchController.searchBar.delegate = searchBarDelegate
  definesPresentationContext = true
}
  
private func configureTableView() {
  tableView.delegate = tableViewDelegate
  tableView.dataSource = tableViewDataSource
  tableView.prefetchDataSource = tableViewDataSourcePrefetching
}
  
private func removeObservers() {
  isLoadingObservation = nil
  userMessageObservation = nil
}
  
private func observeViewModel() {
  
  guard let viewModel = viewModel else { return }
  
  isLoadingObservation = viewModel.observe(\ArticlesViewModel.isLoading, options: [.new]) { [weak self] _, change in
    let show = change.newValue ?? false
    self?.showLoadingIndicator(show)
    self?.tableView.reloadData()
    self?.checkEmptyTableView()
  }
  userMessageObservation = viewModel.observe(\ArticlesViewModel.userMessage, options: [.new]) { [weak self] _, change in
    if let userMessage = change.newValue {
      self?.showUserMessage(userMessage)
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
  
private func checkEmptyTableView() {
  if tableView.dataSource?.tableView(tableView, numberOfRowsInSection: 0) == 0 {
    tableView.backgroundView = emptyView
  } else {
    tableView.backgroundView = nil
  }
}
  
} // extension ArticlesViewController
