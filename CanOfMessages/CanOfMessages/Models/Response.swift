//
//  Response.swift
//  CanOfMessages
//
//  Created by boland on 1/24/17.
//  Copyright © 2017 mallocmedia. All rights reserved.
//

import Foundation

struct Response {
    let message: String
    let id: String
    let group: String //could be an enum
    let created: Date?
    let owner: String?
    //what else would i want in here?
}
