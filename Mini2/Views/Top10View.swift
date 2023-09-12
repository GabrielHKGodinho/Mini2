//
//  GameView.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 01/09/23.
//

import SwiftUI

struct Top10View: View {
    @EnvironmentObject var repository: GameRepository
    let top10 = Top10Repository.list.randomElement()!
    @GestureState private var isDetectingLongPress = false
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 10)
            .updating($isDetectingLongPress) { currentState, gestureState,
                    transaction in
                gestureState = currentState
                transaction.animation = Animation.easeIn(duration: 0.4)
            }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .padding(24)
                .foregroundColor(.gray)
            if !isDetectingLongPress {
                VStack {
                    Text("Secret!")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text("Tap to reveal")
                        .font(.title)
                        .foregroundColor(.white)
                }
            } else {
                VStack(spacing: 16) {
                    Text("Top 10 \(top10.theme)")
                        .foregroundColor(.white)
                        .font(.title)
                        .multilineTextAlignment(.center)
                    ForEach(top10.items, id: \.self) { str in
                        Text(str)
                            .foregroundColor(.white)
                    }
                }
                .padding(32)
            }
        }
        .gesture(longPress)
    }
}
    
struct Top10View_Previews: PreviewProvider {
    static var previews: some View {
        let repository = GameRepository()
        Top10View()
            .environmentObject(repository)
            .onAppear {
                repository.selectedGame = 2
            }
    }
}
