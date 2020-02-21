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
    // Initialization code
  containerView.layer.cornerRadius = 20
  containerView.clipsToBounds = true
}

override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
}
  
func configure(_ viewModel: ArticleTableViewCellViewModel) {
  titleLabel.text = viewModel.abstract
  dateLabel.text = viewModel.publishedDate
}

}
