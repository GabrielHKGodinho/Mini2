//
//  TimerView.swift
//  Mini2
//
//  Created by Isabela Bastos Jastrombek on 28/08/23.
//

import SwiftUI

struct TimerView: View {
    @State var countDownTimer = 100
    @State var timerRunning = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
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
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
