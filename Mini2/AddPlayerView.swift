//
//  AddPlayerView.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 23/08/23.
//

import SwiftUI

struct AddPlayerView: View {
    @State var players = [Player(icon: "circle.fill", name: "Gabi"), Player(icon: "circle.fill", name: "Isa")]
    
    var body: some View {
        VStack {
            ForEach(players) { player in
                Button {
//                    TextField("Teste", text: player.name)
                } label: {
                    HStack {
                        Image(player.icon)
                        Text(player.name)
                    }
                }
            }
            
            Button {
                players.append(Player(icon: "circle.fill", name: "Player \(players.count + 1)"))
            } label: {
                Text("Adicionar player")
                    .foregroundColor(.black)
            }
        }
    }
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView()
    }
}
