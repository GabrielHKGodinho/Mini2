//
//  SceneManager.swift
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
    case EndGameView
}

class SceneManager: ObservableObject {
    @Published var currentView = Views.AddPlayerView
    @Published var animation = AnyTransition.scale
}
