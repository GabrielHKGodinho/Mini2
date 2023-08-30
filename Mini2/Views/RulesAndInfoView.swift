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
            Text(repository.games[repository.selectedGame].name)
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.vertical, 40)
            
            
            VStack {
                TabView(selection: $selection) {
                    ForEach(repository.games[repository.selectedGame].instructions.indices, id: \.self) { i in
//                     ForEach(rules.indices,id: \.self) {index in
                        VStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.gray)
                                        .padding(20)
                                    Text(repository.games[repository.selectedGame].instructions[i])
                                        .padding(32)
                                }
                                .padding(.horizontal, 32)
                                .padding(.bottom, 20)
                        }
                    }

                }
                .shadow(color: .black.opacity(0.2), radius: 6, x: 10, y: 10)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack(spacing: 8) {
                    ForEach(0..<numberOfTabs, id: \.self) { index in
                        Circle()
                            .frame(width: 15, height: 15)
                            .foregroundColor(selection == index ? .white : .white.opacity(0.3))
                            .animation(.easeInOut(duration: 0.2))
                            .padding(.horizontal, 2)
                    }
                }
            }
            .preferredColorScheme(.dark)
            
            
            Button {
                manager.currentView = .SelectKingView
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .frame(height: 70)
                        .padding(32)
                    
                    Text("Play")
                        .font(.title)
                }
            }
            .shadow(color: .black.opacity(0.2), radius: 6, x: 10, y: 10)
            
        }
        .preferredColorScheme(.dark)
        .background(.gray)
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
