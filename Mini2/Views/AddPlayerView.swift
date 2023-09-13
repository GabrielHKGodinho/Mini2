//
//  AddPlayerView.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 23/08/23.
//

import SwiftUI

struct AddPlayerView: View {
    @EnvironmentObject var manager: SceneManager
    
    @State var players = PlayerManager.getPlayers()
    @State var playersNames : [String] = PlayerManager.getPlayersNames()
    
    @State var name: String = "Player \(PlayerManager.getNumberOfPlayers() + 1)"
    @State var isActive: Bool = false
    @State var fieldText: String = ""
    
    @State var isFocused: Bool = false
    
    var body: some View {
        ZStack {
            Color("purple")
                .ignoresSafeArea()
                .onTapGesture {
                    isFocused = false
                }
            
            VStack(alignment: .center, spacing: 16) {
                if !isFocused {
                    Title1(text: "JUNTE A GALERA")
                        .background {
                            Image("mouth")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .scaledToFit()
                                .offset(x: 100, y: 20)
                        }
                        .animation(.linear(duration: 0.15))
                        .padding(.horizontal, 36)
                    Subtitle(text: "Tudo bem amigão, quem está jogando?")
                        .padding(.horizontal, 36)
                        .animation(.linear(duration: 0.15))
                }
                
                PlayerList(isActive: $isActive, isFocused: $isFocused)
                    .animation(.linear(duration: 0.15), value: isFocused)
                
                Spacer()
                
                if !isFocused {
                    Button {
                        for (index, name) in playersNames.enumerated() {
                            PlayerManager.setPlayerName(index: index, name: name)
                        }
                        manager.currentView = .GameListView
                    } label: {
                        PrimaryButton(text: "SELECT GAME", color: Color("purple"), isActive: isActive)
                    }
                    .disabled(PlayerManager.getNumberOfPlayers() == 0)
                    .shadow(color: .black.opacity(0.12), radius: 6, x: 10, y: 10)
                    .animation(.linear(duration: 0.15))
                }
            }
            .padding(.vertical, 24)
            .onAppear {
                if PlayerManager.getNumberOfPlayers() > 0 {
                    isActive = true
                }
            }
        }
    }
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView()
    }
}
