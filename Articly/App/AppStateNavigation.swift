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
  
  articlesViewController.viewModel = ArticlesViewModel(articlesService: getArticlesService(),
                                                       persistenceProvider: CoreDataPersistence(persistentContainer: AppDelegate.instance.persistentContainer))
}
  
} // class AppStateNavigation
