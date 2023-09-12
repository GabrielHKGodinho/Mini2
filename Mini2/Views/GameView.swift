//
//  GameView.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 06/09/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var manager: SceneManager
    @EnvironmentObject var repository: GameRepository
    @State private var showingTimer = false
    @State private var hideTimer = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            repository.games[repository.selectedGame].color
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 24) {
                HStack {
                    ReturnButton(manager: _manager, text: "RULES", path: .RulesView)
                    Spacer()
                    Button {
                        showingTimer.toggle()
                    } label: {
                        Image(systemName: "timer")
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                    }
                }
                
                Title1(text: repository.games[repository.selectedGame].name.uppercased())
                    .baselineOffset(-8)
                
                Spacer()
                
                Tip(icon: "timer", title: "Timer tip!", description: "Use o timer para a resposta final e deixe os nervos à flor-da-pele!")
                
                HStack(alignment: .center) {
                    Button {
                        manager.currentView = .EndGameView
                    } label: {
                        PrimaryButton(text: "FINISH GAME")
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(32)
            
            if showingTimer {
                Color(.black)
                    .opacity(0.5)
                    .ignoresSafeArea()
                    .onTapGesture {
                        hideTimer = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            showingTimer = false
                            hideTimer = false
                        }
                    }
                TimerView(showingTimer: $showingTimer, color: repository.games[repository.selectedGame].color) {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        hideTimer = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        showingTimer = false
                        hideTimer = false
                    }
                }
                .transition(.move(edge: .bottom))
                .animation(.linear(duration: 0.2))
                .offset(y: hideTimer ? UIScreen.main.bounds.height : 0)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let repository = GameRepository()
        GameView()
            .environmentObject(repository)
    }
}
