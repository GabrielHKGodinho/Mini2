//
//  GameView.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 01/09/23.
//

import SwiftUI

struct Top10View: View {
    @EnvironmentObject var manager: Manager
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
        VStack {
            ZStack(alignment: .bottom) {
                repository.games[repository.selectedGame].color
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: hasChosen ? 8 : 16) {
                    HStack {
                        Button {
                            withAnimation {
                                manager.animation = .move(edge: .leading)
                                manager.currentView = .SelectKingView
                            }
                        } label: {
                            ReturnButtonLabel(text: "LEADER SELECTION")
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
                        .padding(.bottom, 8)
                    
                    if !hasChosen {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(.white)
                            
                            VStack {
                                Text("LET'S CHOOSE THE THEME".localized())
                                    .font(Font.custom("Grandstander-Bold", size: 32))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                
                                Spacer()
                                
                                Text(top10.theme)
                                    .font(Font.custom("Grandstander-Bold", size: 28))
                                    .foregroundColor(.black)
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
                                        
                                        Text("NEW THEME".localized())
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
                                            .foregroundColor(.black)
                                            .padding()
                                    }
                                    .frame(maxWidth: .infinity)
                                    
                                    ForEach(Array(top10.items.enumerated()), id: \.element) { index, item in
                                        Text("\(index+1). "+item)
                                            .font(.system(size: 16))
                                            .foregroundColor(.black)
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
                                    Text("Hold to reveal".localized())
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
                                    withAnimation {
                                        manager.animation = .move(edge: .trailing)
                                        manager.currentView = .EndGameView
                                    }
                                } label: {
                                    PrimaryButton(text: "WE'VE FINISHED", color: repository.games[repository.selectedGame].color, type: [2])
                                }
                            } else {
                                Button {
                                    hasChosen = true
                                } label: {
                                    PrimaryButton(text: "START GAME", color: repository.games[repository.selectedGame].color, isActive: generatedTheme, type: [2])
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
                .background(Color("green"))
                
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
                    TimerView(showingTimer: $showingTimer, color: Color("green")) {
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
}

struct Top10View_Previews: PreviewProvider {
    static var previews: some View {
        let repository = GameRepository()
        Top10View()
            .environmentObject(repository)
    }
}

