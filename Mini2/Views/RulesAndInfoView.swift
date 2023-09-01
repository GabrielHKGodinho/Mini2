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
    var rules: [Color] = [.blue, .green, .red, .yellow, .orange]
    
    var body: some View {
        VStack {
            ZStack {
                Text(repository.games[repository.selectedGame].name)
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.vertical, 40)
                
                HStack {
                    Button {
                        manager.currentView = .GameListView
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.title)
                            .bold()
                    }
                    
                    Spacer()
                }
                .padding(32)
            }
            
            
            VStack {
                TabView(selection: $selection) {
                    ForEach(repository.games[repository.selectedGame].instructions.indices, id: \.self) { i in
//                     ForEach(rules.indices,id: \.self) {index in
                        VStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color(uiColor: .systemGray5))
                                        .padding(20)
                                    Text(repository.games[repository.selectedGame].instructions[i])
                                        .multilineTextAlignment(.center)
                                        .padding(40)
                                }
                                .padding(.horizontal, 32)
                                .padding(.bottom, 20)
                        }
                    }

                }
                .shadow(color: .black.opacity(0.12), radius: 6, x: 10, y: 10)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack(spacing: 8) {
                    ForEach(0..<numberOfTabs, id: \.self) { index in
                        Circle()
                            .frame(width: 15, height: 15)
                            .foregroundColor(selection == index ? .white : Color(uiColor: .systemGray5))
                            .animation(.easeInOut(duration: 0.2))
                            .padding(.horizontal, 2)
                            .shadow(color: .black.opacity(0.12), radius: 5, x: 5, y: 5)
                    }
                }
            }
            
            
            Button {
                manager.currentView = .SelectKingView
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .frame(height: 70)
                        .padding(32)
                    
                    Text("Play")
                        .foregroundColor(.black)
                        .font(.title)
                }
            }
            .shadow(color: .black.opacity(0.12), radius: 6, x: 10, y: 10)
            
        }
        .background(Color(uiColor: .systemGray4))
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
