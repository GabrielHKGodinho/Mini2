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
        Text(text.localized())
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            .font(.system(size: 24))
            .foregroundColor(.white)
    }
}

struct Subtitle_Previews: PreviewProvider {
    static var previews: some View {
        Subtitle()
    }
}
