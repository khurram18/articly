//
//  ArticleDetailViewController.swift
//  Articly
//
//  Created by Khurram on 20/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import AlamofireImage
import UIKit

class ArticleDetailViewController: UIViewController {

static let storyboardID = "articleDetailViewControllerStoryboardID"
  
@IBOutlet weak var detailTextView: UITextView!
@IBOutlet weak var titleLabel: UILabel!
@IBOutlet weak var dateLabel: UILabel!
@IBOutlet weak var imageView: UIImageView!
var viewModel: ArticleViewModel?
  
override func viewDidLoad() {
  super.viewDidLoad()
  updateView()
}
  
@IBAction func onOpenInBrowserTap(_ sender: Any) {
  guard let urlString = viewModel?.url,
    let url = URL(string: urlString),
    UIApplication.shared.canOpenURL(url) else { return }
  UIApplication.shared.open(url, options: [: ], completionHandler: nil)
}
  
private func updateView() {
  guard let viewModel = viewModel else { return }
  
  if let urlString = viewModel.imageUrl, let url = URL(string: urlString) {
    imageView.af_setImage(withURL: url, filter: AspectScaledToFillSizeFilter(size: imageView.bounds.size), imageTransition: UIImageView.ImageTransition.crossDissolve(0.5), runImageTransitionIfCached: false)
  }
  dateLabel.text = viewModel.date
  titleLabel.text = viewModel.heading
  detailTextView.text = viewModel.detailText
}
  
}
