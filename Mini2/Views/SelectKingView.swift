//
//  SelectKingView.swift
//  Mini2
//
//  Created by Gabriel Henrique Kwiatkovski Godinho on 28/08/23.
//

import SwiftUI

struct SelectKingView: View {
    @EnvironmentObject var manager: Manager
    @EnvironmentObject var repository: GameRepository
    
    @State var players = PlayerManager.getPlayers()
    
    @State var playerSelected: Int = -1
    @State var aux: Int = -1
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            VStack(alignment: .leading, spacing: 16) {
                Button {
                    withAnimation {
                        manager.animation = .move(edge: .leading)
                        manager.currentView = .RulesView
                    }
                } label: {
                    ReturnButtonLabel(text: "RULES")
                }
                Title2(text: "WHO'S GONNA BE THE (UN)LUCKY?")
                    .fixedSize(horizontal: false, vertical: true)
                    .baselineOffset(-6)
                Subtitle(text: "You can choose a (un)lucky one or leave it to us!")
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.horizontal, 36)
            
            ScrollView() {
                VStack {
                    ForEach(Array(players.enumerated()), id: \.element) { index, player in
                        Button {
                            playerSelected = index
                        } label: {
                            HStack(alignment: .center, spacing: 8) {
                                Image(player.icon)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.white)
                                Text(player.name)
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                                Spacer()
                                if playerSelected == index {
                                    Image(systemName: "crown.fill")
                                        .foregroundColor(.white)
                                        .font(.title2)
                                }
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background {
                                RoundedRectangle(cornerRadius: 100)
                                    .foregroundColor(Color("grayOpacity"))
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
                            }
                            .padding(.horizontal, 4)
                        }
                    }
                    
                }
                .padding(.vertical, 4)
            }
            .padding(.horizontal, 24)
            .scrollIndicators(.hidden)
            
            Button {
                aux = playerSelected
                while playerSelected == aux {
                    playerSelected = Int.random(in: 0..<PlayerManager.getNumberOfPlayers())
                }
            } label: {
                    HStack {
                        Image(systemName: "shuffle")
                            .font(.body)
                            .foregroundColor(Color("red"))
                            .bold()
                        Text("random".localized())
                            .font(.body)
                            .foregroundColor(Color("red"))
                            .bold()
                    }
                    .padding(.horizontal, 52)
                    .padding(.vertical, 12)
                    .background {
                        RoundedRectangle(cornerRadius: 100)
                            .foregroundColor(.white)
                            .opacity(1)
                    }
                }
                        
            Button {
                withAnimation {
                    manager.animation = .move(edge: .trailing)
                    manager.currentView = .GameView
                }
            } label: {
                if (playerSelected == -1) {
                    PrimaryButton(text: "WE APPROVE IT", isActive: false)
                } else {
                    PrimaryButton(text: "WE APPROVE IT", color: Color("red"), type: [2])
                }
            }
            .disabled(playerSelected == -1)
        }
        .padding(.vertical, 24)
        .background(Color("red"))
    }
}

struct SelectKingView_Previews: PreviewProvider {
    static var previews: some View {
        SelectKingView()
    }
}
