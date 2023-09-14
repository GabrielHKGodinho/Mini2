//
//  StartView.swift
//  Mini2
//
//  Created by Gabriel Henrique Kwiatkovski Godinho on 05/09/23.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var manager: SceneManager
    
    @AppStorage("showOnboarding") private var showOnboarding = true
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("logo")
                .resizable()
                .frame(width: 291, height: 151)
            
            Spacer()
            
            Button {
                withAnimation {
                    manager.animation = .move(edge: .trailing)
                    manager.currentView = .AddPlayerView
                }
            } label: {
                PrimaryButton(text: "COMEÇAR A FESTA", isActive: true, alt: true, type: [2])
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.bottom, 40)
        .background(.black)
        
        .fullScreenCover(isPresented: $showOnboarding) {
            ZStack {
                OnboardingView(showOnboarding: $showOnboarding)
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
