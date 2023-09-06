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
                .frame(width: .infinity, height: 44)
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
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton(icon: "plus", text: "Add a buddy")
    }
}
