//
//  Manager.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 29/08/23.
//

import Foundation
import SwiftUI

enum Views {
    case HomeView
    case GameListView
    case AddPlayerView
    case RulesView
    case SelectKingView
    case GameView
    case HowsYoursView
    case BeeeengoView
    case Top10View
    case EndGameView
}

class Manager: ObservableObject {
    @Published var currentView = Views.HomeView
    @Published var animation = AnyTransition.move(edge: .trailing)
    
    let language = UserDefaults.standard.object(forKey: "AppleLanguages") as? [String]
    var lang: String {
        return language?.first ?? "en"
    }
}
