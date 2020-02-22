//
//  ArticlesViewController+UserMessage.swift
//  Articly
//
//  Created by Khurram on 20/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

let animationDuration = 0.5
// How long the message will stay on screeen
let messageDisplayDuration = 5.0

extension ArticlesViewController {
  
func showUserMessage(_ userMessage: String) {
  messageLabel.text = userMessage
  messageView.isHidden = false
  messageView.alpha = 0.0
  UIView.animate(withDuration: animationDuration, animations: {
    self.messageView.alpha = 1.0
    self.messageViewTopConstraint.constant = 0
    self.tableViewTopConstraint.constant = 50
    self.view.layoutIfNeeded()
  }, completion: { _ in
    self.hideMessageView()
  })
}
  
private func hideMessageView() {
  DispatchQueue.main.asyncAfter(deadline: .now() + messageDisplayDuration) {
    if self.isViewVisible {
      UIView.animate(withDuration: animationDuration, animations: {
        self.messageViewTopConstraint.constant = 50
        self.messageView.alpha = 0.0
        self.tableViewTopConstraint.constant = 0
        self.view.layoutIfNeeded()
      }, completion: {_ in
        self.messageLabel.text = ""
        self.messageView.isHidden = true
      })
    } else {
      self.messageView.isHidden = true
      self.messageView.alpha = 0.0
      self.messageViewTopConstraint.constant = 50
      self.tableViewTopConstraint.constant = 0
      self.messageLabel.text = ""
    }
  }
}
  
} // extension ArticlesViewController
