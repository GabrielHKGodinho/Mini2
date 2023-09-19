//
//  TimerView.swift
//  Mini2
//
//  Created by Isabela Bastos Jastrombek on 28/08/23.
//

import SwiftUI

struct TimerView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var countDownTimer = 60
    @State var timerRunning = false
    @Binding var showingTimer: Bool
    let color: Color
    
    var onCloseButtonTap: () -> Void
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(spacing: 24) {
                HStack {
                    Spacer()
                    Button {
                        onCloseButtonTap()
                    } label: {
                        Image(systemName: "xmark.circle")
                            .foregroundColor(.white)
                            .font(.title)
                    }
                }
                
                Text("TIMER".localized())
                    .foregroundColor(.white)
                    .font(Font.custom("Grandstander-Bold", size: 64))
                
                let tempo = countDownTimer
                let min = tempo / 60
                let sec = tempo - (min * 60)
                Text(sec < 10 ? "\(min):0\(sec)" : "\(min):\(sec)")
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                    .bold()
                    .onReceive(timer) { _ in
                        if countDownTimer > 0 && timerRunning {
                            countDownTimer -= 1
                        } else {
                            timerRunning = false
                        }
                    }
                
                HStack(spacing: 16) {
                    Button {
                        countDownTimer = 60
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 40)
                                .fill(Color(uiColor: .white))
                                .frame(width: 80, height: 80)
                            
                            Image(systemName: "arrow.counterclockwise")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .font(.title2)
                        }
                    }
                    
                    Button {
                        if countDownTimer != 0 {
                            timerRunning.toggle()
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 40)
                                .fill(Color(uiColor: .white))
                                .frame(width: 80, height: 80)
                            Image(systemName: timerRunning ? "pause.fill" : "play.fill")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .font(.title2)
                        }
                    }
                    
                    Button {
                        countDownTimer += 60
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 40)
                                .fill(Color(uiColor: .white))
                                .frame(width: 80, height: 80)
                            
                            Text("+1m")
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .font(.title)
                        }
                    }
                }
                
                Button {
                    countDownTimer = 0
                    dismiss()
                } label: {
                    PrimaryButton(text: "FINISH TIMER".localized(), color: color, type: [2])
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 24)
            .background(color)
            //.frame(height: 400, alignment: .bottom)
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(showingTimer: .constant(false), color: Color("green")) {
            
        }
    }
}
