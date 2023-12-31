//
//  SceneManagerView.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 29/08/23.
//

import SwiftUI

struct SceneManagerView: View {
    @StateObject var manager = Manager()
    @StateObject var repository = GameRepository()
    
    var body: some View {
        ZStack {
            switch manager.currentView {
            case .HomeView:
                StartView()
                    //.transition(manager.animation)
            case .GameListView:
                GameListView()
                    //.transition(manager.animation)
            case .AddPlayerView:
                AddPlayerView()
                    //.transition(manager.animation)
            case .RulesView:
                RulesAndInfoView()
                    //.transition(manager.animation)
            case .SelectKingView:
                SelectKingView()
                    //.transition(manager.animation)
            case .GameView:
                GameView()
                    //.transition(manager.animation)
            case .HowsYoursView:
                HowsYoursView()
                    //.transition(manager.animation)
            case .BeeeengoView:
                BeeeengoView()
                    //.transition(manager.animation)
            case .Top10View:
                Top10View()
                    //.transition(manager.animation)
            case .EndGameView:
                EndView()
                    //.transition(manager.animation)
            }
        }
        .environmentObject(manager)
        .environmentObject(repository)
        .preferredColorScheme(.dark)
    }
}

struct SceneManagerView_Previews: PreviewProvider {
    static var previews: some View {
        SceneManagerView()
    }
}
