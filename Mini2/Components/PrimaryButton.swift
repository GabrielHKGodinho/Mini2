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
    
    var body: some View {
        ZStack {
            if isActive {
                if alt {
                    Image("filledButton2")
                } else {
                    Image("filledButton")
                }
            } else {
                Image("strokedButton")
            }
            Text(text)
                .font(Font.custom("Grandstander-Bold", size: 29))
                .foregroundColor(isActive ? (color ?? .black) : .white)
                .offset(y: alt ? 0 : 6)
        }
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "START THE PARTY", alt: true)
    }
}
