//
//  SimpleArticleTableViewCell.swift
//  Articly
//
//  Created by Khurram on 21/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

final class SimpleArticleTableViewCell: UITableViewCell {

static let identifier = "com.example.Articly.SimpleArticleTableViewCell"
  
@IBOutlet weak var containerView: UIView!
@IBOutlet weak var dateLabel: UILabel!
@IBOutlet weak var titleLabel: UILabel!
  
override func awakeFromNib() {
  super.awakeFromNib()
  containerView.layer.cornerRadius = 20
  containerView.clipsToBounds = true
}
  
func configure(_ viewModel: ArticleTableViewCellViewModel) {
  titleLabel.text = viewModel.title
  dateLabel.text = viewModel.publishedDate
}

} // class SimpleArticleTableViewCell
