//
//  AddPlayerView.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 23/08/23.
//

import SwiftUI

struct AddPlayerView: View {
    @EnvironmentObject var manager: Manager
    
    @State var players = PlayerManager.getPlayers()
    @State var playersNames : [String] = PlayerManager.getPlayersNames()
    
    @State var name: String = "Player".localized() + "  \(PlayerManager.getNumberOfPlayers() + 1)"
    @State var fieldText: String = ""
    
    @FocusState var isFocused: Bool
    
    var body: some View {
        ZStack {
            Color("purple")
                .ignoresSafeArea()
                .onTapGesture {
                    isFocused = false
                }
            
            VStack(alignment: .center, spacing: 16) {
                if !isFocused {
                    Title1(text: "GATHER BUDDIES".localized())
                        .background {
                            Image("mouth")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .scaledToFit()
                                .offset(x: 100, y: 20)
                        }
                        .padding(.horizontal, 36)
                    Subtitle(text: "Alright dude, who is playing?".localized())
                        .padding(.horizontal, 36)
                }
                
                ScrollView {
                    VStack {
                        ForEach(Array(players.enumerated()), id: \.element) { index, player in
                            ZStack {
                                RoundedRectangle(cornerRadius: 100)
                                    .foregroundColor(Color("grayOpacity"))
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
                                        .focused($isFocused)
                                        .submitLabel(.done)
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.white)
                                    Spacer()
                                    Button {
                                        PlayerManager.removePlayer(index: index)
                                        playersNames.remove(at: index)
                                        players = PlayerManager.getPlayers()
                                        name = "Player".localized() + "  \(PlayerManager.getNumberOfPlayers() + 1)"
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
                            .padding(.horizontal, 4)
                            .padding(.top, 2)
                        }
                    }
                    .padding(.vertical, 4)
                }
                .padding(.horizontal, 24)
                .scrollIndicators(.never)
                
                Button {
                    PlayerManager.addPlayer(player: Player(icon: PlayerManager.getRandomIcon(), name: "Player".localized() + " \(PlayerManager.getNumberOfPlayers() + 1)"))
                    playersNames.append(PlayerManager.getLastPlayerName())
                    players = PlayerManager.getPlayers()
                } label: {
                    SecondaryButton(icon: "plus", text: "add a buddy".localized())
                        .padding(.horizontal, 28)
                }
                .onDisappear {
                    for (index, name) in playersNames.enumerated() {
                        PlayerManager.setPlayerName(index: index, name: name)
                    }
                }
                .animation(.linear(duration: 0.15), value: isFocused)
                
                Spacer()
                
                if !isFocused {
                    Button {
                        withAnimation {
                            manager.animation = .move(edge: .trailing)
                            manager.currentView = .GameListView
                        }
                    } label: {
                        PrimaryButton(text: "NEXT".localized(), color: Color("purple"), isActive: PlayerManager.getNumberOfPlayers() != 0, type: [2])
                    }
                    .disabled(PlayerManager.getNumberOfPlayers() == 0)
                }
            }
            .padding(.vertical, 24)
        }
    }
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView()
    }
}
