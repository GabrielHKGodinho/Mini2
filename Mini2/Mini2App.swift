//
//  Mini2App.swift
//  Mini2
//
//  Created by Gabriel Henrique Kwiatkovski Godinho on 09/08/23.
//

import SwiftUI

@main
struct Mini2App: App {
    @State var tela : Tela = .addPLayer
    
    var body: some Scene {
        WindowGroup {
            switch tela{
            case .addPLayer:
                AddPlayerView(tela: $tela)
            case .selectGame:
                AddPlayerView(tela: $tela)
            case .rules:
                RulesAndInfoView(tela: $tela)
            case .selectKing:
                SelectKingView(tela: $tela)
            case .game:
                TimerView(tela: $tela)
            case .endGame:
                FimView(tela: $tela)
            }
        }
    }
}

enum Tela {
case addPLayer
case selectGame
case rules
case selectKing
case game
case endGame
}
