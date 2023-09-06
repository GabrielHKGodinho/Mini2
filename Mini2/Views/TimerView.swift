//
//  TimerView.swift
//  Mini2
//
//  Created by Isabela Bastos Jastrombek on 28/08/23.
//

import SwiftUI

struct TimerView: View {
    //    @EnvironmentObject var manager: SceneManager
    //    @EnvironmentObject var repository: GameRepository
    
    @State var countDownTimer = 60
    @State var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                VStack {
                    HStack {
                        Spacer()
                        
                        ZStack{
                            
                            Button {
                                // atualizar a variavel de abrir e fechar a modal depois
                            } label: {
                                Image(systemName: "xmark.circle")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .font(.title)
                            }
                        }
                    }
                    
                    Text ("TIMER")
                        .foregroundColor(.white)
                        .font(Font.custom("Grandstander-Bold", size: 64))
                    
                    Spacer()
                    
                    Group {
                        let tempo = countDownTimer
                        let min = tempo / 60
                        let sec = tempo - (min * 60)
                        Text (sec < 10 ? "\(min):0\(sec)" : "\(min):\(sec)")
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
                    }
                    
                    HStack(spacing: 18) {
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
                    
                    Spacer()
                    
                    Button {
                        countDownTimer = 0
                    } label: {
                        
                        PrimaryButton(text: "Finish Timer")
                        
                    } .padding(42)
                    
                } .padding(42)
                
                Spacer()
            }
            .background(.green)
            .frame(height: 520)
            
        }            .edgesIgnoringSafeArea(.bottom)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        let repository = GameRepository()
        TimerView()
            .environmentObject(repository)
    }
}
