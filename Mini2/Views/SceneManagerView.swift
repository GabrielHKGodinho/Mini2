//
//  SceneManagerView.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 29/08/23.
//

import SwiftUI

struct SceneManagerView: View {
    @StateObject var manager = SceneManager()
    @StateObject var repository = GameRepository()
    
    var body: some View {
        ZStack {
            switch manager.currentView {
            case .HomeView:
                GameListView()
                    .transition(manager.animation)
            case .GameListView:
                GameListView()
                    .transition(manager.animation)
            case .AddPlayerView:
                AddPlayerView()
                    .transition(manager.animation)
            case .RulesView:
                RulesAndInfoView()
                    .transition(manager.animation)
            case .SelectKingView:
                SelectKingView()
                    .transition(manager.animation)
            case .GameView:
                TimerView()
                    .transition(manager.animation)
            case .EndGameView:
                FimView()
                    .transition(manager.animation)
            }
        }
        .environmentObject(manager)
        .environmentObject(repository)
    }
}

struct SceneManagerView_Previews: PreviewProvider {
    static var previews: some View {
        SceneManagerView()
    }
}
