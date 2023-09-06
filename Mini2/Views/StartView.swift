//
//  StartView.swift
//  Mini2
//
//  Created by Gabriel Henrique Kwiatkovski Godinho on 05/09/23.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var manager: SceneManager
    
    var body: some View {
        VStack{
            Spacer()
            
            Image("logo")
                .resizable()
                .frame(width: 291, height: 151)
            
            Spacer()
            
            Button {
                manager.currentView = .AddPlayerView
            } label: {
                PrimaryButton(text: "START THE PARTY")
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.bottom, 40)
        .background(.black)
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
