//
//  EditPlayerModal.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 11/09/23.
//

import SwiftUI

struct EditPlayerModal: View {
    @State var players = PlayerManager.getPlayers()
    @State var playersNames: [String] = PlayerManager.getPlayersNames()
    @State var name: String = "Player".localized() + " \(PlayerManager.getNumberOfPlayers() + 1)"
    
    @Binding var showingModal: Bool
    let color: Color
    
    var onCloseButtonTap: () -> Void
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Spacer()
                    Button {
                        onCloseButtonTap()
                    } label: {
                        Image(systemName: "x.circle")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 36)
                
                Title2(text: "GATHER BUDDIES".localized())
                    .padding(.horizontal, 36)
                
                Spacer()
                
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
                                        //.focused($localFocus)
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.white)
                                    Spacer()
                                    if players.count > 1 {
                                        Button {
                                            PlayerManager.removePlayer(index: index)
                                            playersNames.remove(at: index)
                                            players = PlayerManager.getPlayers()
                                            name = "Player".localized() + " \(PlayerManager.getNumberOfPlayers() + 1)"
                                        } label: {
                                            Image(systemName: "x.circle.fill")
                                                .foregroundColor(.white)
                                                .font(.title2)
                                                .bold()
                                        }
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
            }
            .padding(.vertical, 24)
            .frame(minHeight: 540, maxHeight: 540, alignment: .bottom)
            .background(color)
        }
    }
}

struct EditPlayerModal_Previews: PreviewProvider {
    static var previews: some View {
        EditPlayerModal(showingModal: .constant(false), color: Color("blue")) {
            
        }
    }
}
