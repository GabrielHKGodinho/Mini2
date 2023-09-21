//
//  YouHave20sView.swift
//  Mini2
//
//  Created by Isabela Bastos Jastrombek on 13/09/23.
//

import SwiftUI

struct YouHave20sView: View {
    
    @EnvironmentObject var manager: Manager
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
                HStack(alignment: .center) {
                    Button {
                        withAnimation {
                            manager.animation = .move(edge: .leading)
                            manager.currentView = .RulesView
                        }
                    } label: {
                        ReturnButtonLabel(text: "RULES")
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
                .frame(height: 28)
                
                Title1(text: repository.games[repository.selectedGame].name.uppercased())
                    .fixedSize(horizontal: false, vertical: true)
                    .baselineOffset(-10)
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.2), radius: 6, x: 1, y: 8)
                    VStack {
                        Text("LET'S CHOOSE THE THEME")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .font(Font.custom("Grandstander-Bold", size: 36))
                        
                        Spacer()
                        
                        Text("\(categoria20s)")
                            .font(Font.custom("Grandstander-Bold", size: 28))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        
                        Button {
                            aux = categoria20s
                            while categoria20s == aux {
                                categoria20s = file20s.randomElement()!
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundColor(repository.games[repository.selectedGame].color)
                                    .frame(height: 60)
                                Text("NEW THEME".localized())
                                    .font(.custom("Grandstander-Regular", size: 24))
                                    .foregroundColor(.white)
                                    .baselineOffset(-4)
                            }
                        }
                    }
                    .padding(.horizontal, 28)
                    .padding(.vertical, 36)
                }
                
                Spacer()
                
                Button {
                    withAnimation {
                        manager.animation = .move(edge: .trailing)
                        manager.currentView = .EndGameView
                    }
                } label: {
                    PrimaryButton(text: "WE'VE FINISHED", color: Color("cyan"), isActive: true, alt: true, type: [2])
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
