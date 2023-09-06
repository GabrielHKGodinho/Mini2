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
        VStack(spacing: 12) {
            
            HStack {
                Button {
                    manager.currentView = .GameListView
                } label: {
                    
                    Text("< GAMES")
                        .foregroundColor(.white)
                        .font(Font.custom("Grandstander-Bold", size: 24))
                }
                
                Spacer()
            }
            .padding(.horizontal, 36)
            
            HStack {
                Text("TAKE A LOOK AT THE RULES")
                    .multilineTextAlignment(.leading)
                    .frame(width: 300)
                    .foregroundColor(.white)
                    .font(Font.custom("Grandstander-Bold", size: 64))
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.horizontal, 32)
            
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
                                        
                                        Text(repository.games[repository.selectedGame].instructions[i])
                                            .font(.system(size: 20))
                                            .multilineTextAlignment(.center)
                                            .padding(28)
                                    }
                                }
                                .padding(.horizontal, 36)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            
            Button {
                manager.currentView = .SelectKingView
            } label: {
                PrimaryButton(text: "LET'S PLAY", color: false)
            }
            .padding(.bottom, 12)
            .padding(.top, 40)
        }
        .padding(.top, 36)
        .padding(.bottom, 24)
        .background(Color("DarkBackground"))
        .onAppear {
            numberOfTabs = repository.games[repository.selectedGame].instructions.count
        }
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
