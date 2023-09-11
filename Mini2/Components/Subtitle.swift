//
//  Subtitle.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 11/09/23.
//

import SwiftUI

struct Subtitle: View {
    var text: String = ""
    
    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.leading)
            .font(.system(size: 24))
            .padding(.leading, -48)
            .foregroundColor(.white)
    }
}

struct Subtitle_Previews: PreviewProvider {
    static var previews: some View {
        Subtitle()
    }
}
