//
//  Item.swift
//  Fetch Rewards Assignment
//
//  Created by Latheeshwarraj Mohanraj on 12/7/20.
//  Copyright © 2020 Veg World. All rights reserved.
//

import Foundation

struct Item: Codable {
    let id, listID: Int
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id
        case listID = "listId"
        case name
    }
}

typealias Items = [Item]
