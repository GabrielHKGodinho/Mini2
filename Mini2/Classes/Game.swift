//
//  Game.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 24/08/23.
//

import Foundation

class Game {
    var name: String
    var description: String
    var icon : String
    var categories = [Category]()
    
    init(name: String = "Default Name", description: String = "Default Description", icon: String = "defaultIcon", categories: [Category] = []) {
        self.name = name
        self.description = description
        self.icon = icon
        for category in categories {
            self.categories.append(category)
        }
    }
}
