//
//  Item.swift
//  Todoey
//
//  Created by Данил Фролов on 24.09.2021.
//

import Foundation

struct Item: Encodable, Decodable {
    var title : String = ""
    var done = false
}
