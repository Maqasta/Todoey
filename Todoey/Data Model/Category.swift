//
//  Category.swift
//  Todoey
//
//  Created by Данил Фролов on 05.10.2021.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
