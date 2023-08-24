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
    var categories = [Category]()
    
    init(name: String, description: String, categories: [Category]) {
        self.name = name
        self.description = description
        for category in categories {
            self.categories.append(category)
        }
    }
}
