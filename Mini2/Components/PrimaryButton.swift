//
//  PrimaryButton.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 05/09/23.
//

import SwiftUI

struct PrimaryButton: View {
    let text: String
    var color: Color?
    var isActive: Bool = true
    var alt: Bool = false
    var type: [Int]? = [0, 1, 2]

    
    var body: some View {
        ZStack {
            if isActive {
                if alt {
                    switch type {
                    case [0]:
                        Image("filledButton2")
                            .shadow(color: .black.opacity(0.55), radius: 6, x: 1, y: 8)
                        
                    case [1]:
                        Image("filledButton2")
                            .shadow(color: .black.opacity(0.4), radius: 6, x: 1, y: 8)
                        
                    case [2]:
                        Image("filledButton2")
                            .shadow(color: .black.opacity(0.2), radius: 6, x: 1, y: 8)
                        
                    default:
                        Image("filledButton2")
                    }
                } else {
                    Image("filledButton")
                }
            } else {
                Image("strokedButton")
            }
            Text(text)
                .baselineOffset(-3)
                .font(Font.custom("Grandstander-Bold", size: 29))
                .foregroundColor(isActive ? (color ?? .black) : .white)
                .offset(y: alt ? 0 : 6)
        }
    }
}


struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "PRÓXIMO", alt: true, type: [0])
    }
}
