//
//  AppStateNavigation.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import NetworkClient
import UIKit

final class AppStateNavigation {

private let window: UIWindow
  
init(_ window: UIWindow) {
  self.window = window
  configureArticlesScreen()
}

private func configureArticlesScreen() {
  guard let navigationController = window.rootViewController as? UINavigationController,
    let articlesViewController = navigationController.viewControllers.first as? ArticlesViewController else { return }
  
  let articlesViewModel = ArticlesViewModel(articlesService: getArticlesService(),
                                            persistenceProvider: CoreDataPersistence(persistentContainer: AppDelegate.instance.persistentContainer))
  articlesViewModel.onArticleSelected = { [weak self] article in
    self?.showArticleDetail(article)
  }
  articlesViewController.viewModel = articlesViewModel
}
  
private func showArticleDetail(_ article: Article) {
  guard let navigationController = window.rootViewController as? UINavigationController,
    let detailsViewController = navigationController.storyboard?.instantiateViewController(identifier: ArticleDetailViewController.storyboardID) as? ArticleDetailViewController else { return }
  
  detailsViewController.viewModel = ArticleViewModel(article: article)
  navigationController.pushViewController(detailsViewController, animated: true)
}
  
} // class AppStateNavigation
