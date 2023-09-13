//
//  GameTitle.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 11/09/23.
//

import SwiftUI

struct GameTitle: View {
    var text: String = ""
    
    var body: some View {
        Text(text)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(.black)
            .font(Font.custom("Grandstander-Bold", size: 36))
            .padding(.bottom, -8)
    }
}

struct GameTitle_Previews: PreviewProvider {
    static var previews: some View {
        GameTitle()
    }
}
