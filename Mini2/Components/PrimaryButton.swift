//
//  PrimaryButton.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 05/09/23.
//

import SwiftUI

struct PrimaryButton: View {
    let text: String
    var color: Bool
    var isActive: Bool = true
    
    var body: some View {
        ZStack {
            Text(text)
                .font(Font.custom("Grandstander-Bold", size: 29))
                .foregroundColor(color ? Color(.white) : Color.black)
                .offset(y: 6)
                .background {
                    if isActive {
                        Image("FilledButton")
                    } else {
                        Image("StrokedButton")
                    }
                }
        }
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "START THE PARTY", color: true, isActive: false)
    }
}
