//
//  PrimaryButton.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 05/09/23.
//

import SwiftUI

struct PrimaryButton: View {
    let text: String
    
    var body: some View {
        ZStack {
            Color(.gray)
            Text(text)
                .font(Font.custom("Grandstander-Bold", size: 29))
                .offset(y: 6)
                .background {
                    Image("ButtonBackground")
                }
        }
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "START THE PARTY")
    }
}
