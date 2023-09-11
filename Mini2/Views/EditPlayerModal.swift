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
    @State var name: String = "Player \(PlayerManager.getNumberOfPlayers() + 1)"
    
    @Binding var showingModal: Bool
    var onCloseButtonTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack {
                Spacer()
                Button {
                    onCloseButtonTap()
                } label: {
                    Image(systemName: "x.circle")
                        .font(.title2)
                        .foregroundColor(.white)
                }
            }
            
            Text("JUNTE A GALERA")
                .foregroundColor(.white)
                .font(Font.custom("Grandstander-Bold", size: 40))
                .padding(.bottom, -8)
                .baselineOffset(-8)
            
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
                            Image(systemName: players[index].icon)
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
                Button {
                    PlayerManager.addPlayer(player: Player(name: "Player \(PlayerManager.getNumberOfPlayers() + 1)"))
                    playersNames.append(PlayerManager.getLastPlayerName())
                    players = PlayerManager.getPlayers()
                } label: {
                    SecondaryButton(icon: "plus", text: "Add a buddy")
                }
            }
        }
        .padding(24)
        .background(.green)
        .frame(height: 400, alignment: .bottom)
    }
}

struct EditPlayerModal_Previews: PreviewProvider {
    static var previews: some View {
        EditPlayerModal(showingModal: .constant(false)) {
            
        }
    }
}
