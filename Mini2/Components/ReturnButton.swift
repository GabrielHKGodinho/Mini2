//
//  Navigation.swift
//  Mini2
//
//  Created by Murilo Correa Pasquim on 06/09/23.
//

import Foundation
import SwiftUI

struct ReturnButton: View {
    @EnvironmentObject var manager: SceneManager

    var text: String
    @State var path: Views
    
    var body: some View {
        Button {
            manager.currentView = path
        } label: {
            Text("< \(text)")
                .foregroundColor(.white)
                .font(Font.custom("Grandstander-regular", size: 24))
        }
    }
    
    struct ReturnButton_preview: PreviewProvider {
        static var previews: some View {
            ReturnButton(text: "START THE PARTY", path: .HomeView)
        }
    }
}
