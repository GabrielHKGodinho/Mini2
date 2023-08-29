//
//  SelectKingView.swift
//  Mini2
//
//  Created by Gabriel Henrique Kwiatkovski Godinho on 28/08/23.
//

import SwiftUI

struct SelectKingView: View {
    @EnvironmentObject var manager: SceneManager
    
    var players = ["1","2"]
    @State var playerSelected : Int = -1
    
    var body: some View {
        VStack{
            ZStack {
                
                HStack {
                    Text("Select the Master")
                        .frame(width: 200)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 40))
                        .bold()
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        ZStack{
                            Circle()
                                .frame(width: 60)
                                .foregroundColor(.gray)
                            
                            Image(systemName: "arrow.triangle.swap")
                                .font(.system(size: 26))
                                .foregroundColor(.white)
                        }//fim zstack
                    }//fim button
                    .padding(.trailing, 12)
                }//fim hstack
                .padding(16)

            }
            
            ScrollView{
                ForEach(Array(players.enumerated()), id: \.element){index, player in
                    Button {
                        playerSelected = index
                    } label: {
                        ZStack {
                            
                            HStack{
                                Circle()
                                    .frame(width: 60)
                                    .foregroundColor(.gray)
                                    .padding(.leading, 16)
                                
                                Text("Player Name")
                                    .foregroundColor(.black)
                                    .bold()
                                    .font(.system(size: 20))
                                    .padding(.leading, 8)
                                
                                Spacer()
                            }
                            .padding(.vertical, 12)
//                            .frame(maxWidth: .infinity, maxHeight: 100)
                            .background(Color(uiColor: .systemGray2))
                            .cornerRadius(16)
                            
                            if playerSelected == index {
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(lineWidth: 6)
                                    .foregroundColor(.black)
                                    .cornerRadius(16)
                            }
                            
                        }//fim zstack
                    }//fim button

                }//fim foreach
            }//fim scroll viem
            
            Spacer()
            
            Button {
                manager.currentView = .GameView
            } label: {
                HStack{
                    Text("Start Game")
                        .foregroundColor(.black)
                        .bold()
                        .font(.system(size: 20))
                }
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color(uiColor: .systemGray2))
                .cornerRadius(16)
            }//fim button
            .padding(.bottom, 32)
            
        }//fim Vstack
        .padding(.horizontal)
    }
}

struct SelectKingView_Previews: PreviewProvider {
    static var previews: some View {
        SelectKingView()
    }
}