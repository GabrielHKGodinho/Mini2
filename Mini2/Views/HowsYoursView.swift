//
//  GameView.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 06/09/23.
//

import SwiftUI

struct HowsYoursView: View {
    @EnvironmentObject var manager: SceneManager
    @EnvironmentObject var repository: GameRepository
    @State private var showingTimer = false
    @State private var hideTimer = false
    @State var word: String = ""
    @FocusState var isFocused: Bool
    @State var hasWritten: Bool = false
    @GestureState private var isDetectingLongPress = false
    
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
                        Image(systemName: "timer")
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                    }
                    .disabled(isFocused)
                }
                
                Title1(text: repository.games[repository.selectedGame].name.uppercased())
                    .baselineOffset(-8)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 8)
                
                if !hasWritten {
                    withAnimation {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(.white)
                            if word.isEmpty && !isFocused {
                                Text("Toque para digitar a palavra escolhida")
                                    .font(.system(size: 24))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                            }
                            TextField("", text: $word, axis: .vertical)
                                .focused($isFocused)
                                .baselineOffset(-2)
                                .padding(.vertical, 24)
                                .padding(.horizontal, 16)
                                .font(Font.custom("Grandstander-Bold", size: 48))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .submitLabel(.done)
                                .onChange(of: word) { _ in
                                    if word.last?.isNewline == .some(true) {
                                        word.removeLast()
                                        isFocused = false
                                    }
                                }
                        }
                        .frame(maxHeight: 280)
                        .animation(.linear(duration: 0.2))
                    }
                } else {
                    ZStack {
                        if isDetectingLongPress {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(.white)
                            Text(word)
                                .font(Font.custom("Grandstander-Bold", size: 48))
                                .foregroundColor(.black)
                        } else {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(Color("gray"))
                            VStack {
                                Image("topSecretPurple")
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
                
                if (!isFocused) {
                    withAnimation {
                        Tip(icon: "timer", title: "Timer tip!", description: "Use o timer para a resposta final e deixe os nervos à flor-da-pele!")
                            .padding(.bottom, 24)
                            .animation(.linear(duration: 0.15))
                    }
                        
                    HStack(alignment: .center) {
                        if hasWritten {
                            Button {
                                manager.currentView = .EndGameView
                            } label: {
                                PrimaryButton(text: "TERMINAMOS", color: repository.games[repository.selectedGame].color)
                            }
                        } else {
                            Button {
                                hasWritten = true
                            } label: {
                                PrimaryButton(text: "COMEÇAR O JOGO", color: repository.games[repository.selectedGame].color, isActive: !word.isEmpty)
                            }
                            .disabled(word.isEmpty)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .animation(.linear(duration: 0.15))
                }
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

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let repository = GameRepository()
        HowsYoursView()
            .environmentObject(repository)
    }
}
