//
//  GameListView.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 25/08/23.
//

import SwiftUI

struct GameListView: View {
    @EnvironmentObject var repository: GameRepository
    @EnvironmentObject var manager: Manager
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 16) {
                Button {
                    withAnimation {
                        manager.animation = .move(edge: .leading)
                        manager.currentView = .AddPlayerView
                    }
                } label: {
                    ReturnButtonLabel(text: "PLAYERS")
                }
                Title1(text: "TIME TO PLAY")
                    .background {
                        Image("hand")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 160)
                            .offset(x: 120, y: 20)
                    }
                Subtitle(text: "Choose a game!")
            }
            
            ScrollView {
                VStack(spacing: 24) {
                    ForEach(0..<repository.games.count, id: \.self) { i in
                        ZStack {
                            RoundedRectangle(cornerRadius: 22)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                            VStack(alignment: .leading) {
                                HStack(alignment: .center, spacing: 12) {
                                    Image(systemName: repository.games[i].icon)
                                        .resizable()
                                        .foregroundColor(repository.games[i].color)
                                        .frame(width: 36, height: 36)
                                        .scaledToFit()
                                    GameTitle(text: repository.games[i].name)
                                    Spacer()
                                }
                                .frame(alignment: .center)
                                Text(repository.games[i].description)
                                    .font(.body)
                                    .foregroundColor(.black)
                            }
                            .padding(24)
                        }
                        .onTapGesture {
                            repository.selectedGame = i
                            withAnimation {
                                manager.animation = .move(edge: .trailing)
                                manager.currentView = .RulesView
                            }
                        }
                    }
                }
            }
            .scrollIndicators(.never)
        }
        .padding(.horizontal, 36)
        .padding(.vertical, 24)
        .background(Color("blue"))
        .ignoresSafeArea(edges: .bottom)
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        let repository = GameRepository()
        GameListView()
            .environmentObject(repository)
    }
}
