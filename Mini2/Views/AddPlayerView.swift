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
    
    @State var name: String = "Player \(PlayerManager.getNumberOfPlayers() + 1)"
    @State var isEditing: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Spacer()
            
            ForEach(Array(players.enumerated()), id: \.element){index, player in
                if !(isEditing && player.id == players.last!.id) {
                    HStack(alignment: .center, spacing: 8) {
                        Image(systemName: player.icon)
                            .foregroundColor(.white)
                        Text(player.name)
                            .foregroundColor(.white)
                        Button {
                            PlayerManager.removePlayer(index: index)
                            players = PlayerManager.getPlayers()
                            name = "Player \(PlayerManager.getNumberOfPlayers() + 1)"
                        } label: {
                            Image(systemName: "trash.fill")
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background {
                        RoundedRectangle(cornerRadius: 24)
                            .foregroundColor(.black)
                    }
                }
            }
            
            if isEditing {
                TextField("", text: $name, prompt: Text("Player \(PlayerManager.getNumberOfPlayers())"))
                    .onSubmit {
                        isEditing = false
                        PlayerManager.setPlayerName(index: PlayerManager.getNumberOfPlayers()-1, name: name)
                        players = PlayerManager.getPlayers()
                        name = "Player \(PlayerManager.getNumberOfPlayers() + 1)"
                    }
                    .autocorrectionDisabled()
                    .frame(width: CGFloat(PlayerManager.getLastPlayerName().count + 8) * 5, alignment: .center)
                    .textFieldStyle(.roundedBorder)
            }

            Button {
                PlayerManager.addPlayer(player: Player(name: "Player  \(PlayerManager.getNumberOfPlayers())"))
                isEditing = true
                players = PlayerManager.getPlayers()
            } label: {
                Text("Adicionar player")
                    .foregroundColor(.black)
            }//fim button
            .buttonStyle(.bordered)
            
            Spacer()
            
            Button {
                manager.currentView = .GameListView
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                    
                    Text("Next")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.black)
                }
            }//fim button
            .padding(.bottom, 16)
        }//fim vstack
        .padding(.horizontal)
    }
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView()
    }
}
