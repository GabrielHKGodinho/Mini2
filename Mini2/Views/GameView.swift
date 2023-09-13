//
//  GameView.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 13/09/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var repository: GameRepository
    
    var body: some View {
        switch repository.selectedGame {
        case 0:
            HowsYoursView()
        case 1:
            Top10View()
        case 2:
            BeeeengoView()
        default:
            Top10View()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let repo = GameRepository()
        GameView()
            .environmentObject(repo)
    }
}
