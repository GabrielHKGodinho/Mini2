//
//  YouHave20sView.swift
//  Mini2
//
//  Created by Isabela Bastos Jastrombek on 13/09/23.
//

import SwiftUI

struct YouHave20sView: View {
    
    @EnvironmentObject var manager: SceneManager
    @EnvironmentObject var repository: GameRepository
    @State private var showingTimer = false
    @State private var hideTimer = false
    @State var word: String = ""
    @FocusState var isFocused: Bool
    @State var hasWritten: Bool = false
    @State var categoria20s = Top10Repository.list.randomElement()!
    
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Button {
                    manager.currentView = .RulesView
                } label: {
                    Text("< REGRAS")
                        .foregroundColor(.white)
                        .font(Font.custom("Grandstander-regular", size: 24))
                }
                .disabled(isFocused)
                
                Spacer()
                
                Button {
                    showingTimer.toggle()
                } label: {
                    Image(systemName: "timer")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                        .frame(width: 30, height: 30)
                }
                .disabled(isFocused)
            }
            
            Title1(text: "VC TEM 20 SEGUNDOS")
                .baselineOffset(-8)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 8)
            
            RoundedRectangle(cornerRadius: 42)
                .frame(height: 390)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.2), radius: 6, x: 1, y: 8)
                .overlay {
                    Button {
                        
                    } label: {
                        VStack {
                            Text("BORA ESCOLHER A CATEGORIA")
                                .multilineTextAlignment(.center)
                                .frame(width: 250)
                                .foregroundColor(.black)
                                .font(Font.custom("Grandstander-Bold", size: 35))
                                .padding(.top, 32)
                            
                            Text("-")
                                .multilineTextAlignment(.center)
                                .frame(width: 250)
                                .foregroundColor(.black)
                                .font(Font.custom("Grandstander-Bold", size: 35))
                                .padding(.top, 32)
                            
                            Spacer()
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 100)
                                    .frame(width: 260, height: 55)
                                    .foregroundColor(Color("cyan"))
                                Text("NOVA CATEGORIA")
                                    .foregroundColor(.white)
                                    .font(Font.custom("Grandstander-regular", size: 20))
                                
                            }
                        }
                        .padding(.vertical, 40)
                    }
                    
                }
                .padding(.vertical)
            
            Spacer()
            
            PrimaryButton(text: "TERMINAMOS", color: Color("cyan"), isActive: true, alt: true, type: [2])
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding(.horizontal, 36)
        .padding(.vertical, 24)
        .background(Color("cyan"))
    }
}

struct YouHave20sView_Previews: PreviewProvider {
    static var previews: some View {
        let repository = GameRepository()
        YouHave20sView()
            .environmentObject(repository)
            .onAppear {
                repository.selectedGame = 3
            }
    }
}
