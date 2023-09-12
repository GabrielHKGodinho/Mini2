//
//  Title2.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 11/09/23.
//

import SwiftUI

struct Title2: View {
    var text: String = ""
    
    var body: some View {
        Text(text)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.white)
            .font(Font.custom("Grandstander-Bold", size: 48))
            .padding(.bottom, -8)
    }
}

struct Title2_Previews: PreviewProvider {
    static var previews: some View {
        Title2()
    }
}
