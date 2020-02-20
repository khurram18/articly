//
//  ArticlesViewController+UserMessage.swift
//  Articly
//
//  Created by Khurram on 20/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

let animationDuration = 0.5
// How long the message is displayed on screen
let messageDisplayDuration = 5.0

extension ArticlesViewController {
func showUserMessage(_ userMessage: String) {
  messageLabel.text = userMessage
  UIView.animate(withDuration: animationDuration, animations: {
    self.messageView.isHidden = false
    self.messageViewTopConstraint.constant = 0
    self.tableViewTopConstraint.constant = 50
    self.view.layoutIfNeeded()
  }, completion: { _ in
    self.hideMessageView()
  })
}
private func hideMessageView() {
  DispatchQueue.main.asyncAfter(deadline: .now() + messageDisplayDuration) {
    UIView.animate(withDuration: animationDuration, animations: {
      self.messageView.isHidden = true
      self.messageViewTopConstraint.constant = 50
      self.tableViewTopConstraint.constant = 0
      self.view.layoutIfNeeded()
    }, completion: {_ in
      self.messageLabel.text = ""
    })
  }
}
} // extension ArticlesViewController
