//
//  BeeeengoView.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 13/09/23.
//

import SwiftUI

struct BeeeengoView: View {
    @EnvironmentObject var manager: SceneManager
    @EnvironmentObject var repository: GameRepository
    @State private var showingTimer = false
    @State private var hideTimer = false
    @State var word: String = ""
    @FocusState var isFocused: Bool
    @State var hasChosen: Bool = false
    @GestureState private var isDetectingLongPress = false
    
    @State var numberSelected: Int?
    
    @State private var animationAmount: CGFloat = 1
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 10)
            .updating($isDetectingLongPress) { currentState, gestureState,
                    transaction in
                gestureState = currentState
                //transaction.animation = Animation.(duration: 0.2)
            }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            repository.games[repository.selectedGame].color
                .ignoresSafeArea()
                .onTapGesture {
                    isFocused = false
                }
            
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Button {
                        manager.currentView = .SelectKingView
                    } label: {
                        Text("< SELEÇÃO DE MESTRE")
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
                    .baselineOffset(-8)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 8)
                
                if !hasChosen {
                    withAnimation {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(.white)
                            VStack(alignment: .center) {
                                Text("QUAL MEU NÚMERO?")
                                    .font(.custom("Grandstander-Bold", size: 36))
                                    .foregroundColor(.black)
                                    .baselineOffset(-4)
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                Spacer()
                                
                                if let numberSelected = numberSelected {
                                    Text("\(numberSelected)")
                                        .font(.system(size: 40))
                                        .foregroundColor(.black)
                                        .bold()
                                } else {
                                    Text("-")
                                        .font(.system(size: 40))
                                        .foregroundColor(.black)
                                        .bold()
                                }
                                
                                Spacer()
                                
                                Button {
                                    numberSelected = Int.random(in: 0...10)
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 30)
                                            .foregroundColor(repository.games[repository.selectedGame].color)
                                            .frame(height: 60)
                                        Text("NOVO NÚMERO")
                                            .font(.custom("Grandstander-Regular", size: 24))
                                            .foregroundColor(.white)
                                            .baselineOffset(-4)
                                    }
                                }
                            }
                            .padding(.horizontal, 36)
                            .padding(.vertical, 28)
                        }
                        .frame(maxHeight: .infinity)
                        .animation(.linear(duration: 0.2))
                    }
                } else {
                    ZStack {
                        if isDetectingLongPress {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(.white)
                            Text("\(numberSelected!)")
                                .font(.system(size: 40))
                                .bold()
                                .foregroundColor(.black)
                        } else {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(Color("gray"))
                            VStack {
                                Image("topSecretBlue")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120)
                                Text("Segure para revelar")
                                    .font(.system(size: 24))
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .frame(maxHeight: .infinity)
                    .gesture(longPress)
                }

                Spacer()
                
                Tip(icon: "timer", title: "Timer tip!", description: "Use o timer para a resposta final e deixe os nervos à flor-da-pele!")
                    .padding(.bottom, 24)
//                    .animation(.linear(duration: 0.15))
                        
                HStack(alignment: .center) {
                    if hasChosen {
                        Button {
                            withAnimation {
                                manager.currentView = .EndGameView
                            }
                        } label: {
                            PrimaryButton(text: "TERMINAMOS", color: repository.games[repository.selectedGame].color, type: [2])
                        }
                    } else {
                        Button {
                            hasChosen = true
                        } label: {
                            PrimaryButton(text: "COMEÇAR O JOGO", color: repository.games[repository.selectedGame].color, isActive: numberSelected != nil, type: [2])
                        }
                        .disabled(numberSelected == nil)
                    }
                }
                .frame(maxWidth: .infinity)
//                .animation(.linear(duration: 0.15))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 36)
            .padding(.vertical, 24)
            
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
                TimerView(showingTimer: $showingTimer, color: repository.games[repository.selectedGame].color) {
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

struct BeeeengoView_Previews: PreviewProvider {
    static var previews: some View {
        let repository = GameRepository()
        BeeeengoView()
            .environmentObject(repository)
    }
}
