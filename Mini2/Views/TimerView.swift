//
//  TimerView.swift
//  Mini2
//
//  Created by Isabela Bastos Jastrombek on 28/08/23.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var manager: SceneManager
    
    @State var countDownTimer = 60
    @State var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        VStack {
            
            Text("Game Title")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.vertical, 40)
            
            Spacer()
            
            Group {
                let tempo = countDownTimer
                let min = tempo / 60
                let sec = tempo - (min * 60)
                Text (sec < 10 ? "\(min):0\(sec)" : "\(min):\(sec)")
                    .font(.system(size: 80))
                    .bold()
                    .padding(.top, 8)
                    .onReceive(timer) { _ in
                        if countDownTimer > 0 && timerRunning {
                            countDownTimer -= 1
                        } else {
                            timerRunning = false
                        }
                    }
            }
            
            HStack(spacing: 32) {
                Button {
                    countDownTimer = 60
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color(uiColor: .systemGray4))
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: "arrow.counterclockwise")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .font(.title)
                    }
                }
                
                
                Button {
                    if countDownTimer != 0 {
                        timerRunning.toggle()
                    }
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color(uiColor: .systemGray4))
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: timerRunning ? "pause" : "play")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .font(.title)
                    }
                }
                
                Button {
                    countDownTimer += 60
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color(uiColor: .systemGray4))
                            .frame(width: 80, height: 80)
                        
                        Text("+1m")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .font(.title)
                    }
                }
            }
            
            Spacer()
            
            Button {
                countDownTimer = 0
                manager.currentView = .EndGameView
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color(uiColor: .systemGray4))
                        .frame(height: 80)
                    
                    Text("Finish Game")
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                }
            }
            
        }
        .padding(32)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
