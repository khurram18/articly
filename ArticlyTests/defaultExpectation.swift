//
//  defaultExpectation.swift
//  ArticlyTests
//
//  Created by Khurram on 20/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
  
func defaultExpectation(_ functionName: String = #function) -> XCTestExpectation {
  expectation(description: functionName)
}
  
} // extension XCTestCase
