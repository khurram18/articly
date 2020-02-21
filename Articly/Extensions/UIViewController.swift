//
//  UIViewController.swift
//  Articly
//
//  Created by Khurram on 21/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

extension UIViewController {

var isViewVisible: Bool {
  isViewLoaded && view.window != nil
}
  
} // extension UIViewController
