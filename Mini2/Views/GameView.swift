//
//  GameView.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 01/09/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var repository: GameRepository
    let top10 = Top10Repository.list.randomElement()!
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Top 10 \(top10.theme)")
                .font(.title)
                .multilineTextAlignment(.center)
            ForEach(top10.items, id: \.self) { str in
                Text(str)
            }
        }
        .padding(32)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let repository = GameRepository()
        GameView()
            .environmentObject(repository)
            .onAppear {
                repository.selectedGame = 2
            }
    }
}
