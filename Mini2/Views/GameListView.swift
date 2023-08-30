//
//  GameListView.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 25/08/23.
//

import SwiftUI

struct GameListView: View {
    @EnvironmentObject var repository: GameRepository
    @EnvironmentObject var manager: SceneManager
    
//    @State var categories = [Category(name: "Singleplayer"), Category(name: "Multiplayer"), Category(name: "Improviso"), Category(name: "Mímica")]
//    @State var selectedCategories = [Category]()
    
    var body: some View {
        VStack(spacing: 16) {
            ForEach(0..<repository.games.count) { i in
                HStack {
                    Text(repository.games[i].name)
                        .foregroundColor(.white)
                    Text(repository.games[i].description)
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                }
                .onTapGesture {
                    manager.currentView = .RulesView
                    repository.selectedGame = i
                }
            }
            Spacer()
        }
        .padding(16)
    }
}

//struct GameListView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameListView()
//    }
//}
