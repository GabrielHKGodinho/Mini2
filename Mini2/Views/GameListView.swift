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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("SELECT GAME")
                .foregroundColor(.white)
                .font(Font.custom("Grandstander-Bold", size: 64))
            
            Text("Time to choose")
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.white)
            
            ScrollView {
                VStack(spacing: 24) {
                    ForEach(0..<repository.games.count, id: \.self) { i in
                        ZStack {
                            RoundedRectangle(cornerRadius: 22)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                            VStack(alignment: .leading) {
                                HStack() {
                                    Image(systemName: repository.games[i].icon)
                                        .foregroundColor(.black)
                                    Text(repository.games[i].name.uppercased())
                                        .foregroundColor(.black)
                                        .font(Font.custom("Grandstander-Bold", size: 32))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                Text(repository.games[i].description)
                            }
                            .padding(24)
                        }
                        .onTapGesture {
                            manager.currentView = .RulesView
                            repository.selectedGame = i
                        }
                    }
                }
            }
        }
        .padding(32)
        .background(.black)
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        let repository = GameRepository()
        GameListView()
            .environmentObject(repository)
    }
}
