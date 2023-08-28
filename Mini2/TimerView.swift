//
//  TimerView.swift
//  Mini2
//
//  Created by Isabela Bastos Jastrombek on 28/08/23.
//

import SwiftUI

struct TimerView: View {
    @State var countDownTimer = 300
    @State var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        
        VStack {
            
            Group {
                let tempo = countDownTimer
                let min = tempo / 60
                let sec = tempo - (min * 60)
                Text (sec < 10 ? "\(min):0\(sec)" : "\(min):\(sec)")
                    .font(.title)
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
            
            HStack(spacing: 16) {
                Button {
                    countDownTimer = 300
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color(uiColor: .lightGray))
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: "arrow.counterclockwise")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .font(.title)
                    }
                }
                
                
                Button {
                    timerRunning.toggle()
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color(uiColor: .lightGray))
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: timerRunning ? "play" : "pause")
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
                            .fill(Color(uiColor: .lightGray))
                            .frame(width: 80, height: 80)
                        
                        Text("+1m")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .font(.title)
                    }
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
