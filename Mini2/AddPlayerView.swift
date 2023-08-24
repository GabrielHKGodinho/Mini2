//
//  AddPlayerView.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 23/08/23.
//

import SwiftUI

struct AddPlayerView: View {
    @State var players = [Player(icon: "circle.fill", name: "Gabi"), Player(icon: "circle.fill", name: "Isa")]
    @State var name: String = ""
    @State var isEditing: Bool = false

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            ForEach(players) { player in
                if !(isEditing && player.id == players.last!.id) {
                    HStack(alignment: .center, spacing: 8) {
                        Image(systemName: player.icon)
                            .foregroundColor(.white)
                        Text(player.name)
                            .foregroundColor(.white)
                        Button {
                            players.remove(at: players.firstIndex(where: { $0.id == player.id })!)
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
                TextField("", text: $players.last!.name, prompt: Text("Player \(players.count + 1)"))
                    .onSubmit {
                        isEditing = false
                    }
                    .autocorrectionDisabled()
                    .frame(width: CGFloat(players.last!.name.count + 8) * 5, alignment: .center)
                    .textFieldStyle(.roundedBorder)
            }

            Button {
                players.append(Player(icon: "circle.fill", name: "Player \(players.count+1)"))
                isEditing = true
            } label: {
                Text("Adicionar player")
                    .foregroundColor(.black)
            }
            .buttonStyle(.bordered)
        }
    }
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView()
    }
}
