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
    @FocusState var isFocused: Bool
    @State var hasChosen: Bool = false
    @State var file20s = JsonManager.fill20sec()
    @State var categoria20s = "-"
    @State var aux = ""
    
    var body: some View {
        ZStack(alignment: .bottom) {
            repository.games[repository.selectedGame].color
                .ignoresSafeArea()
                .onTapGesture {
                    isFocused = false
                }
            
            VStack(spacing: 16) {
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
                        TimerButtonLabel()
                    }
                    .disabled(isFocused)
                }
                
                Title1(text: repository.games[repository.selectedGame].name.uppercased())
                    .fixedSize(horizontal: false, vertical: true)
                    .baselineOffset(-10)
                    .padding(.bottom, 8)
                
                RoundedRectangle(cornerRadius: 42)
                    .frame(height: 380)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.2), radius: 6, x: 1, y: 8)
                    .overlay {
                        VStack {
                            Text("BORA ESCOLHER A CATEGORIA")
                                .multilineTextAlignment(.center)
                                .frame(width: 250, height: 80)
                                .foregroundColor(.black)
                                .font(Font.custom("Grandstander-Bold", size: 35))
                                .padding(.top)
                            
                            
                            Text("\(categoria20s)")
                                .multilineTextAlignment(.center)
                                .font(Font.custom("Grandstander-Bold", size: 30))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .frame(width: 250, height: 80)
                                .padding(.top, 24)
                            
                            Spacer()
                            
                            
                            Button {
                                aux = categoria20s
                                while categoria20s == aux {
                                    categoria20s = file20s.randomElement()!
                                }
                                
                            } label: {
                                VStack {
                                    
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
                            }
                        }
                        .padding(.vertical, 40)
                        
                    }
                    .padding(.vertical, 6)
                
                Spacer()
                
                Button {
                    manager.currentView = .EndGameView
                } label: {
                    PrimaryButton(text: "TERMINAMOS", color: Color("cyan"), isActive: true, alt: true, type: [2])
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(.horizontal, 36)
            .padding(.vertical, 24)
            .background(Color("cyan"))
            
            if showingTimer {
                Color(.black)
                    .opacity(0.5)
                    .ignoresSafeArea()
                    .onTapGesture {
                        hideTimer = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            showingTimer = false
                            hideTimer = false
                        }
                    }
                TimerView(showingTimer: $showingTimer, color: Color("cyan")) {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        hideTimer = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        showingTimer = false
                        hideTimer = false
                    }
                }
                .transition(.move(edge: .bottom))
                .animation(.linear(duration: 0.2))
                .offset(y: hideTimer ? UIScreen.main.bounds.height : 0)
            }
        }
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
