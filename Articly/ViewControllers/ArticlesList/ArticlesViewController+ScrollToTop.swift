//
//  ArticlesViewController+ScrollToTop.swift
//  Articly
//
//  Created by Khurram on 21/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

private var performingShowAnimation = false
private var performingHideAnimation = false

private var lastY = CGFloat(Int.min)

extension ArticlesViewController {
  
func updateScrollToTopButtonVisibility() {
  if tableView.contentOffset.y <= lastY {
    showTopButton()
  } else {
    hideTopButton()
  }
  lastY = tableView.contentOffset.y
}

@objc func onScrollToTopButtonTap() {
  tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .middle, animated: true)
  hideTopButton()
}
  
private func showTopButton() {
  if !scrollToTopButton.isHidden || performingShowAnimation {
    return
  }
  if let visibleRows = tableView.indexPathsForVisibleRows,
    let _ = visibleRows.first(where: { $0.row == 0}) {
    return
  }
  performingShowAnimation = true
  UIView.animate(withDuration: animationDuration, animations: {
    self.scrollToTopButton.isHidden = false
    self.topButtonTopConstraint.constant = -25
    self.view.layoutIfNeeded()
  }) { _ in
    performingShowAnimation = false
  }
}
  
private func hideTopButton() {
  if scrollToTopButton.isHidden || performingHideAnimation {
    return
  }
  performingHideAnimation = true
  UIView.animate(withDuration: animationDuration, animations: {
    self.topButtonTopConstraint.constant = 50
    self.view.layoutIfNeeded()
  }) { _ in
    self.scrollToTopButton.isHidden = true
    performingHideAnimation = false
  }
}
  
} // extension ArticlesViewController
