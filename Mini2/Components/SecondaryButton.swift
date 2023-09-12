//
//  SecondaryButton.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 05/09/23.
//

import SwiftUI

struct SecondaryButton: View {
    var icon: String?
    let text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 100)
                .stroke(lineWidth: 1)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 44)
                .background {
                    RoundedRectangle(cornerRadius: 100)
                        .foregroundColor(.white)
                        .opacity(0.3)
                }
            HStack {
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.title2)
                        .foregroundColor(.white)
                }
                Text(text)
                    .foregroundColor(.white)
                    .font(.title2)
            }
        }
        //.shadow(color: .black.opacity(0.25), radius: 8, x: 2, y: 4)
        //.shadow(color: Color(red: 36, green: 35, blue: 32).opacity(0.15), radius: 9, x: 0, y: 7)
        //.shadow(color: Color(red: 36, green: 35, blue: 32).opacity(0.09), radius: 5, x: 5, y: 4)
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton(icon: "plus", text: "Add a buddy")
    }
}
