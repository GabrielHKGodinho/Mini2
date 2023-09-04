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
    
    @State var playerSelected : Int = -1
    @State var aux : Int = -1
    
    var body: some View {
        VStack{
            VStack {
                ZStack {
                    ZStack {
                        Text("Select the Master")
                            .multilineTextAlignment(.center)
                            .frame(width: 200)
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.vertical, 40)
                        
                        HStack {
                            Button {
                                manager.currentView = .RulesView
                            } label: {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                                    .font(.title)
                                    .bold()
                            }
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            Button {
                                aux = playerSelected
                                while playerSelected == aux {
                                    playerSelected = Int.random(in: 0..<PlayerManager.getNumberOfPlayers())
                                }
                            } label: {
                                ZStack{
                                    Circle()
                                        .frame(width: 60)
                                        .foregroundColor(.gray)
                                    
                                    Image(systemName: "arrow.triangle.swap")
                                        .font(.system(size: 26))
                                        .foregroundColor(.white)
                                } // fim zstack
                                .shadow(color: .black.opacity(0.12), radius: 5, x: 5, y: 5)
                            } // fim button
                        } // fim hstack
                    }
                }
                
                ScrollView {
                    ForEach(Array(players.enumerated()), id: \.element) { index, player in
                        Button {
                            playerSelected = index
                        } label: {
                            ZStack {
                                HStack {
                                    Circle()
                                        .frame(width: 60)
                                        .foregroundColor(.gray)
                                        .padding(.leading, 16)
                                    
                                    Text(player.name)
                                        .foregroundColor(.black)
                                        .bold()
                                        .font(.system(size: 20))
                                        .padding(.leading, 8)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 12)
                                .background(Color(uiColor: .systemGray2))
                                .cornerRadius(16)
                                
                                if playerSelected == index {
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(lineWidth: 6)
                                        .foregroundColor(.black)
                                        .cornerRadius(16)
                                }
                                
                            } // fim zstack
                        } // fim button
                    } // fim foreach
                } // fim scroll viem
                
                Spacer()
                
                Button {
                    switch repository.selectedGame {
                    case 2:
                        manager.currentView = .Top10View
                    default:
                        manager.currentView = .GameView
                    }
                } label: {
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(uiColor: .systemGray).opacity(playerSelected == -1 ? 0.5 : 1))
                                .frame(height: 70)
                            
                            Text("Start Game")
                                .foregroundColor(.black.opacity(playerSelected == -1 ? 0.5 : 1))
                                .font(.title)
                        }
                    }
                    .shadow(color: .black.opacity(0.12), radius: 6, x: 10, y: 10)
                } //fim button
                .padding(.bottom, 32)
                .disabled(playerSelected == -1)
            } // fim Vstack
            .padding(.horizontal, 32)
        }
        .background(Color(uiColor: .systemGray4))
    }
}

struct SelectKingView_Previews: PreviewProvider {
    static var previews: some View {
        SelectKingView()
    }
}
