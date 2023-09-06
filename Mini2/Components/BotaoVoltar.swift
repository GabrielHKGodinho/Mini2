//
//  Navigation.swift
//  Mini2
//
//  Created by Murilo Correa Pasquim on 06/09/23.
//

import Foundation
import SwiftUI

struct botaoVoltar: View {
    @EnvironmentObject var manager: SceneManager

    var text: String
    @State var path: Views
    
    var body: some View {
        Button {
            manager.currentView = path
        } label: {
            
            Text("< \(text)")
                .foregroundColor(.black)
                .font(Font.custom("Grandstander-regular", size: 24))
        }
        
    }
    
    struct botaoVoltar_preview: PreviewProvider {
        static var previews: some View {
            botaoVoltar(text: "START THE PARTY", path: .HomeView)
        }
    }
}
