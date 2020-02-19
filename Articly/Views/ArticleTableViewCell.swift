//
//  ArticleTableViewCell.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

static let identifier = "com.example.Articly.ArticleTableViewCell"
  
func configure(_ viewModel: ArticleTableViewCellViewModel) {
  textLabel?.text = viewModel.abstract
}
  
override func awakeFromNib() {
  super.awakeFromNib()
}

override func setSelected(_ selected: Bool, animated: Bool) {
  super.setSelected(selected, animated: animated)
}

}
