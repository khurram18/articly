//
//  AppStateNavigation.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

final class AppStateNavigation: AppNavigation {

private let window: UIWindow
private let dependencyManager: DependencyManager
  
init(window: UIWindow, dependencyManager: DependencyManager) {
  self.window = window
  self.dependencyManager = dependencyManager
  configureArticlesScreen()
}

private func configureArticlesScreen() {
  guard let navigationController = window.rootViewController as? UINavigationController,
    let articlesViewController = navigationController.viewControllers.first as? ArticlesViewController else { return }
  
  dependencyManager.resolve(for: articlesViewController)
}
  
func showArticleDetail(article: Article) {
  guard let navigationController = window.rootViewController as? UINavigationController,
    let detailsViewController = navigationController.storyboard?.instantiateViewController(identifier: ArticleDetailViewController.storyboardID) as? ArticleDetailViewController else { return }
  
  dependencyManager.resolve(for: detailsViewController, article: article)
  navigationController.pushViewController(detailsViewController, animated: true)
}
  
} // class AppStateNavigation
