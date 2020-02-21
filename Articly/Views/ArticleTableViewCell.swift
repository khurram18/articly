//
//  ArticleTableViewCell.swift
//  Articly
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import AlamofireImage
import UIKit

final class ArticleTableViewCell: UITableViewCell {

static let identifier = "com.example.Articly.ArticleTableViewCell"
  
@IBOutlet weak var dateLabel: UILabel!
@IBOutlet weak var titleLabel: UILabel!
@IBOutlet weak var bannerImageView: UIImageView!
  
func configure(_ viewModel: ArticleTableViewCellViewModel) {
  titleLabel.text = viewModel.title
  dateLabel.text = viewModel.publishedDate
  guard let imageString = viewModel.image,
    let imageUrl = URL(string: imageString) else { return }
  bannerImageView.af_setImage(withURL: imageUrl, placeholderImage: #imageLiteral(resourceName: "placeholder"), filter: AspectScaledToFillSizeFilter(size: bannerImageView.bounds.size), imageTransition: UIImageView.ImageTransition.crossDissolve(0.5), runImageTransitionIfCached: false)
}

override func prepareForReuse() {
  super.prepareForReuse()
  titleLabel.text = nil
  dateLabel.text = nil
  bannerImageView.af_cancelImageRequest()
  bannerImageView.image = #imageLiteral(resourceName: "placeholder")
}
  
override func awakeFromNib() {
  super.awakeFromNib()
  bannerImageView.layer.cornerRadius = 20
  bannerImageView.clipsToBounds = true
}
  
} // class ArticleTableViewCell
