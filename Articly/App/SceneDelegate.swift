//
//  SceneDelegate.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

var window: UIWindow?
private var appStateNavigation: AppStateNavigation?

func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
  guard let window = window else { return }
  appStateNavigation = AppStateNavigation(window)
}

func sceneDidEnterBackground(_ scene: UIScene) {
  (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
}
  
} // class SceneDelegate