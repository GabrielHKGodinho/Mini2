//
//  GameView.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 01/09/23.
//

import SwiftUI

struct Top10View: View {
    @EnvironmentObject var manager: SceneManager
    @EnvironmentObject var repository: GameRepository
    @State private var showingTimer = false
    @State private var hideTimer = false
    @FocusState var isFocused: Bool
    @State var hasChosen: Bool = false
    @GestureState private var isDetectingLongPress = false
    @State var top10 = Top10(theme: "------", items: [""])
    @State var json = JsonManager.fillTop10()
    @State var generatedTheme = false
    
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
            
            VStack(alignment: .leading, spacing: hasChosen ? 8 : 16) {
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
                
                if !hasChosen {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.white)
                        
                        VStack {
                            Text("BORA ESCOLHER A CATEGORIA")
                                .font(Font.custom("Grandstander-Bold", size: 32))
                            .multilineTextAlignment(.center)
                            
                            Spacer()
                            
                            Text(top10.theme)
                                .font(Font.custom("Grandstander-Bold", size: 28))
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                            
                            Button {
                                top10 = json.randomElement()!
                                generatedTheme = true
                            } label: {
                                HStack{
                                    Image(systemName: "arrow.clockwise")
                                        .foregroundColor(.white)
                                        .bold()
                                    
                                    Text("SORTEAR CATEGORIA")
                                        .bold()
                                        .font(.system(size: 18))
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(20)
                                .background(Color("green"))
                                .cornerRadius(30)
                                .padding()
                            }

                        }
                        .padding(.top, 74)
                        .padding(.bottom, 40)
                        .padding(.horizontal, 15)
                        
                    }
                    .frame(maxHeight: .infinity)
                } else {
                    ZStack {
                        if isDetectingLongPress {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(.white)
                            
                            VStack(alignment: .leading) {
                                VStack(alignment: .center) {
                                    Text(top10.theme)
                                        .multilineTextAlignment(.center)
                                        .font(Font.custom("Grandstander-Bold", size: 30))
                                    .padding()
                                }
                                .frame(maxWidth: .infinity)
                                
                                ForEach(Array(top10.items.enumerated()), id: \.element) { index, item in
                                    Text("\(index+1). "+item)
                                        .font(.system(size: 16))
                                        .padding(.leading, 20)
                                        .padding(.bottom, 4)
                                }
                            }
                            
                        } else {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(Color("gray"))
                            VStack {
                                Image("topSecretGreen")
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
                        
                    HStack(alignment: .center) {
                        if hasChosen {
                            Button {
                                manager.currentView = .EndGameView
                            } label: {
                                PrimaryButton(text: "TERMINAMOS", color: repository.games[repository.selectedGame].color)
                            }
                        } else {
                            Button {
                                hasChosen = true
                            } label: {
                                PrimaryButton(text: "COMEÇAR O JOGO", color: repository.games[repository.selectedGame].color, isActive: generatedTheme)
                            }
                            .disabled(!generatedTheme)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .animation(.linear(duration: 0.15))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, hasChosen ? 24 : 36)
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

struct Top10View_Previews: PreviewProvider {
    static var previews: some View {
        let repository = GameRepository()
        Top10View()
            .environmentObject(repository)
    }
}

