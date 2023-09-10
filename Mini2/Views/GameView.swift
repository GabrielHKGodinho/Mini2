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
            Color(.black)
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
                
                Text(repository.games[repository.selectedGame].name.uppercased())
                    .foregroundColor(.white)
                    .font(Font.custom("Grandstander-Bold", size: 64))
                    .padding(.bottom, -8)
                
                Spacer()
                    
                VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Image(systemName: "timer")
                                .foregroundColor(.white)
                                .bold()
                            Text("Timer tip!")
                                .font(.body)
                                .bold()
                                .foregroundColor(.white)
                        }
                        Text("Use o timer para a resposta final e deixe os nervos à flor-da-pele!")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.bottom, 32)

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
            .padding(36)
            
            if showingTimer {
                Color(.black)
                    .opacity(0.3)
                    .onTapGesture {
                        hideTimer = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            showingTimer = false
                            hideTimer = false
                        }
                    }
                TimerView(showingTimer: $showingTimer) {
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
