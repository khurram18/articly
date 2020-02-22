//
//  Date.swift
//  Articly
//
//  Created by Khurram on 23/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation

extension Date {
/// Returns the date of seven days before
static func getPastDate() -> Date? {
  var dateComponents = DateComponents()
  dateComponents.day = -7
  return Calendar.current.date(byAdding: dateComponents, to: Date())
}
  
} // extension Date
