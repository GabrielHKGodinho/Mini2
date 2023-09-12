//
//  PlayerList.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 12/09/23.
//

import SwiftUI

struct PlayerList: View {
    @State var players = PlayerManager.getPlayers()
    @State var playersNames: [String] = PlayerManager.getPlayersNames()
    @State var name: String = "Player \(PlayerManager.getNumberOfPlayers() + 1)"
    @Binding var isActive: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(Array(players.enumerated()), id: \.element) { index, player in
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
                    .padding(.horizontal, 4)
                    .padding(.top, 2)
                }
            }
            .padding(.vertical, 4)
        }
        .padding(.horizontal, 24)
        .scrollIndicators(.never)
        
        Button {
            PlayerManager.addPlayer(player: Player(icon: PlayerManager.getRandomIcon(), name: "Player \(PlayerManager.getNumberOfPlayers() + 1)"))
            playersNames.append(PlayerManager.getLastPlayerName())
            players = PlayerManager.getPlayers()
            isActive = PlayerManager.getNumberOfPlayers() == 0 ? false : true
        } label: {
            SecondaryButton(icon: "plus", text: "adicionar amigo")
                .padding(.horizontal, 28)
        }
    }
}

struct PlayerList_Previews: PreviewProvider {
    static var previews: some View {
        PlayerList(isActive: .constant(false))
    }
}
