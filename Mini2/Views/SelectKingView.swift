//
//  SelectKingView.swift
//  Mini2
//
//  Created by Gabriel Henrique Kwiatkovski Godinho on 28/08/23.
//

import SwiftUI

struct SelectKingView: View {
    @EnvironmentObject var manager: SceneManager
    @EnvironmentObject var repository: GameRepository
    
    @State var players = PlayerManager.getPlayers()
    
    @State var playerSelected: Int = -1
    @State var aux: Int = -1
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            VStack(alignment: .leading, spacing: 24) {
                ReturnButton(manager: _manager, text: "RULES", path: .RulesView)
                
                Text("WHO'S GONNA BE THE (UN)LUCKY?")
                    .foregroundColor(.white)
                    .font(Font.custom("Grandstander-Bold", size: 48))
                
                Text("You can choose a (un)lucky one or leave it to us!")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
            }
            Spacer()
            
            ForEach(Array(players.enumerated()), id: \.element) { index, player in
                Button {
                    playerSelected = index
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 100)
                            .foregroundColor(Color("gray"))
                            .frame(maxWidth: .infinity, maxHeight: 55)
                        if playerSelected == index {
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(lineWidth: 3)
                                .frame(maxWidth: .infinity, maxHeight: 55)
                                .foregroundColor(.white)
                        } else {
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(lineWidth: 1)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, maxHeight: 55)
                        }
                        HStack(alignment: .center, spacing: 9) {
                            Image(systemName: player.icon)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                            Text(player.name)
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                    }
                }
            }
            
            Button {
                aux = playerSelected
                while playerSelected == aux {
                    playerSelected = Int.random(in: 0..<PlayerManager.getNumberOfPlayers())
                }
            } label: {
                SecondaryButton(icon: "shuffle", text: "get it randomly")
            }
            
            Spacer()
            
            Button {
                manager.currentView = .GameView
            } label: {
                if (playerSelected == -1) {
                    PrimaryButton(text: "NEXT", isActive: false)
                } else {
                    PrimaryButton(text: "NEXT")
                }
            }
            .disabled(playerSelected == -1)
        }
        .padding(.horizontal, 32)
        .padding(.bottom, 24)
        .background(.black)
    }
}

struct SelectKingView_Previews: PreviewProvider {
    static var previews: some View {
        SelectKingView()
    }
}
