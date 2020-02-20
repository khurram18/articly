//
//  ArticleDetailViewController.swift
//  Articly
//
//  Created by Khurram on 20/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {

static let storyboardID = "articleDetailViewControllerStoryboardID"
  
var viewModel: ArticleViewModel?
  
@IBOutlet weak var headingLabel: UILabel!
  
override func viewDidLoad() {
  super.viewDidLoad()
  updateView()
}
  
private func updateView() {
  headingLabel.text = viewModel?.heading
}
  
}
