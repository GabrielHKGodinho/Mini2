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
        VStack {
            
            HStack {
                Button {
                    manager.currentView = .GameListView
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                        .padding(.vertical, 2)
                }
                
                Spacer()
            }
            .padding(.horizontal, 32)
            
            Text("Take a look at the rules")
                .multilineTextAlignment(.center)
                .frame(width: 300)
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            VStack {
                TabView(selection: $selection) {
                    ForEach(repository.games[repository.selectedGame].instructions.indices, id: \.self) { i in
                        VStack {
                            RoundedRectangle(cornerRadius: 42)
                                .fill(.white)
                                .overlay {
                                    VStack {
                                        Text(repository.games[repository.selectedGame].name)
                                            .foregroundColor(.black)
                                            .font(.largeTitle)
                                            .fontWeight(.semibold)
                                            .padding(.vertical, 40)
                                        
                                        Text(repository.games[repository.selectedGame].instructions[i])
                                            .multilineTextAlignment(.center)
                                            .padding(40)
                                        
                                        Spacer()
                                        
                                        CustomTabViewIndicator(selection: $selection, numberOfTabs: numberOfTabs)
                                    }
                                    
                                }
                                .padding(.horizontal, 32)
                        }
                    }

                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            
            Button {
                manager.currentView = .SelectKingView
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 42)
                        .fill(.white)
                        .frame(height: 70)
                        .padding(32)
                    
                    Text("Let's go")
                        .foregroundColor(.black)
                        .font(.title)
                }
            }
        }
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
