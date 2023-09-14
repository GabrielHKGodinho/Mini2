//
//  Tip.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 11/09/23.
//

import SwiftUI

struct Tip: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .bold()
                Text(title)
                    .font(.body)
                    .bold()
                    .foregroundColor(.white)
            }
            Text(description)
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: 1)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
        }
    }
}

struct Tip_Previews: PreviewProvider {
    static var previews: some View {
        Tip(icon: "timer", title: "Timer tip!", description: "Use o timer para a resposta final e deixe os nervos à flor-da-pele!")
    }
}
