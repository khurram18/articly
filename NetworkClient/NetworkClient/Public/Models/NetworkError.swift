//
//  NetworkError.swift
//  NetworkClient
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
  
case urlCreation
case noData
  
}

extension NetworkError: CustomStringConvertible {
  
public var description: String {
  switch self {
  case .urlCreation:
    return "An error occurred."
  case .noData:
    return "No response from server, please try later."
  }
}
  
}

extension NetworkError: CustomDebugStringConvertible {
  
public var debugDescription: String {
  switch self {
  case .urlCreation:
    return "Url creation failed."
  case .noData:
    return "Response data is nil."
  }
}
  
}


//switch self {
//case .urlCreation:
//  return "An error occurred."
//}
