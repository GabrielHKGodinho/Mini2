//
//  TimerButton.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 13/09/23.
//

import SwiftUI

struct TimerButtonLabel: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Image(systemName: "timer")
            .resizable()
            .scaledToFit()
            .frame(height: 28)
            .foregroundColor(.white)
            .bold()
            .foregroundColor(.white)
            .scaleEffect(animationAmount)
            .animation(
                .linear(duration: 1)
                .delay(0)
                .repeatCount(10, autoreverses: true), value: animationAmount)
            .onAppear {
                animationAmount = 1.1
            }
    }
}

struct TimerButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        TimerButtonLabel()
    }
}
