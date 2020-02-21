//
//  DependencyManager.swift
//  Articly
//
//  Created by Khurram on 21/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import NetworkClient
import Foundation

final class DependencyManager {
  
weak var appNavigation: AppNavigation?
  
func resolve(for viewController: ArticlesViewController) {
  let articlesViewModel = ArticlesViewModel(articlesService: getArticlesService(),
                                            persistenceProvider: CoreDataPersistence(persistentContainer: AppDelegate.instance.persistentContainer))
  articlesViewModel.onArticleSelected = { [weak self] article in
    self?.appNavigation?.showArticleDetail(article: article)
  }
  viewController.searchBarDelegate = ArticlesSearchBarDelegate(viewModel: articlesViewModel)
  viewController.tableViewDelegate = ArticlesTableViewDelegate(viewModel: articlesViewModel)
  viewController.tableViewDataSource = ArticlesTableViewDataSource(viewModel: articlesViewModel)
  viewController.tableViewDataSourcePrefetching = ArticlesTableViewDataSourcePrefetching(viewModel: articlesViewModel)
  viewController.viewModel = articlesViewModel
}
  
func resolve(for viewController: ArticleDetailViewController, article: Article) {
  viewController.viewModel = ArticleViewModel(article: article)
}
  
} // class DependencyManager
