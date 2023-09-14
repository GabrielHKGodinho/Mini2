//
//  RulesAndInfoView.swift
//  Mini2
//
//  Created by Isabela Bastos Jastrombek on 24/08/23.
//

import SwiftUI

struct RulesAndInfoView: View {
    @EnvironmentObject var manager: SceneManager
    @EnvironmentObject var repository: GameRepository
    @State private var selection = 0
    @State private var numberOfTabs = 1
    
    var body: some View {
        VStack(spacing: 32) {
            VStack(alignment: .center, spacing: 16) {
                HStack {
                    ReturnButton(manager: _manager, text: "JOGOS", path: .GameListView)
                    Spacer()
                }
                .padding(.horizontal, 36)
                Title2(text: "CONFIRA AS REGRAS")
                    .padding(.horizontal, 36)
            }
                
            VStack(spacing: 24) {
                TabView(selection: $selection) {
                    ForEach(repository.games[repository.selectedGame].instructions.indices, id: \.self) { i in
                        ZStack {
                            RoundedRectangle(cornerRadius: 42)
                                .foregroundColor(.white)
                            VStack(spacing: 0) {
                                Text(repository.games[repository.selectedGame].name)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 250)
                                    .foregroundColor(.black)
                                    .font(Font.custom("Grandstander-Bold", size: 36))
                                    .padding(.top, 32)
                                
                                Spacer()
                                
                                Image(repository.games[repository.selectedGame].instructions[i].1)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 180)
                                
                                Spacer()
                                
                                Text(repository.games[repository.selectedGame].instructions[i].0)
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 32)
                                    .padding(.horizontal, 16)
                            }
                            .padding(.bottom)
                        }
                        .padding(.horizontal, 36)
                    }
                }
                .shadow(color: .black.opacity(0.2), radius: 6, x: 1, y: 8)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                CustomTabViewIndicator(selection: $selection, numberOfTabs: repository.games[repository.selectedGame].instructions.count, darkMode: false)
                    .padding(.horizontal, 48)
            }
                
            Button {
                withAnimation {
                    manager.animation = .move(edge: .trailing)
                    if repository.selectedGame != 3 {
                        manager.currentView = .SelectKingView
                    } else {
                        manager.currentView = .GameView
                    }
                }
            } label: {
                PrimaryButton(text: "LET'S PLAY", color: repository.games[repository.selectedGame].color, isActive: true, alt: true, type: [1])
            }
            .padding(.horizontal, 36)
        }
        .onAppear {
            numberOfTabs = repository.games[repository.selectedGame].instructions.count
        }
        .padding(.vertical, 24)
        .background(repository.games[repository.selectedGame].color)
    }
}

struct RulesAndInfoView_Previews: PreviewProvider {
    static var previews: some View {
        let manager = SceneManager()
        let repository = GameRepository()
        RulesAndInfoView()
            .environmentObject(manager)
            .environmentObject(repository)
    }
}
