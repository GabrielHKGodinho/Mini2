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
    @State var isEditing: Bool = false
    @State var isActive: Bool = false
    @State var fieldText: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Title1(text: "JUNTE A GALERA")
                .background {
                    Image("mouth")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .scaledToFit()
                        .offset(x: 100, y: 20)
                }
            Subtitle(text: "Tudo bem amigão, quem está jogando?")
            
            Spacer()
            
            ScrollView {
                ForEach(Array(players.enumerated()), id: \.element){ index, player in
                    ZStack {
                        RoundedRectangle(cornerRadius: 100)
                            .foregroundColor(Color("gray"))
                            .frame(maxWidth: .infinity, maxHeight: 55)
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 55)
                        HStack(alignment: .center, spacing: 9) {
                            Image(players[index].icon)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                            TextField("", text: $playersNames[index])
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                            Spacer()
                            Button {
                                PlayerManager.removePlayer(index: index)
                                playersNames.remove(at: index)
                                players = PlayerManager.getPlayers()
                                name = "Player \(PlayerManager.getNumberOfPlayers() + 1)"
                            } label: {
                                Image(systemName: "x.circle.fill")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .bold()
                            }
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                    }
                }
            }
            .scrollIndicators(.never)
            
            Button {
                PlayerManager.addPlayer(player: Player(icon: PlayerManager.getRandomIcon(), name: "Player \(PlayerManager.getNumberOfPlayers() + 1)"))
                playersNames.append(PlayerManager.getLastPlayerName())
                isEditing = true
                players = PlayerManager.getPlayers()
                isActive = PlayerManager.getNumberOfPlayers() == 0 ? false : true
            } label: {
                SecondaryButton(icon: "plus", text: "adicionar amigo")
            }
            
            Spacer()
            
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
        }
        .padding(.horizontal, 36)
        .padding(.vertical, 24)
        .background(Color("purple"))
    }
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView()
    }
}
