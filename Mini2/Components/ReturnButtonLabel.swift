//
//  Navigation.swift
//  Mini2
//
//  Created by Murilo Correa Pasquim on 06/09/23.
//

import Foundation
import SwiftUI

struct ReturnButtonLabel: View {
    var text: String
    
    var body: some View {
        Text("< \(text.localized())")
            .foregroundColor(.white)
            .font(Font.custom("Grandstander-regular", size: 24))
    }
    
    struct ReturnButtonLabel_preview: PreviewProvider {
        static var previews: some View {
            ReturnButtonLabel(text: "START THE PARTY")
        }
    }
}
