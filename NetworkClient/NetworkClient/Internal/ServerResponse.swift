//
//  ServerResponse.swift
//  NetworkClient
//
//  Created by Khurram on 19/02/2020.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation

struct ServerResponse: Decodable {
let response: Response
}

struct Response: Decodable {
let meta: Meta
let docs: [Article]
}
