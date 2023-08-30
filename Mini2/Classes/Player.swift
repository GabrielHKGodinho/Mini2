//
//  Player.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 23/08/23.
//

import Foundation

struct Player: Identifiable, Hashable {
    let id = UUID()
    let icon: String
    var name: String
    
    init(icon: String = "deafult", name: String) {
        self.icon = icon
        self.name = name
    }
}
