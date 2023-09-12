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
        VStack(alignment: .center, spacing: 16) {
            HStack {
                ReturnButton(manager: _manager, text: "GAMES", path: .GameListView)
                Spacer()
            }
            .padding(.horizontal, 36)
            Title2(text: "CONFIRA AS REGRAS")
                .padding(.horizontal, 36)
            Spacer()
            VStack {
                TabView(selection: $selection) {
                    ForEach(repository.games[repository.selectedGame].instructions.indices, id: \.self) { i in
                        VStack {
                            RoundedRectangle(cornerRadius: 42)
                                .fill(.white)
                                .overlay {
                                    ZStack {
                                        VStack {
                                            Text(repository.games[repository.selectedGame].name)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 250)
                                                .foregroundColor(.black)
                                                .font(Font.custom("Grandstander-Bold", size: 36))
                                                .padding(.vertical, 40)
                                            
                                            Spacer()
                                            
                                            CustomTabViewIndicator(selection: $selection, numberOfTabs: numberOfTabs, darkMode: false)
                                        }
                                        
                                        Text(repository.games[repository.selectedGame].instructions[i].0)
                                            .font(.system(size: 20))
                                            .multilineTextAlignment(.center)
                                            .padding(28)
                                    }
                                }
                        }
                        .padding(.horizontal, 36)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            
            Button {
                manager.currentView = .SelectKingView
            } label: {
                PrimaryButton(text: "LET'S PLAY", color: repository.games[repository.selectedGame].color)
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
