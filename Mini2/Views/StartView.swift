//
//  StartView.swift
//  Mini2
//
//  Created by Gabriel Henrique Kwiatkovski Godinho on 05/09/23.
//

import SwiftUI
import RiveRuntime

struct StartView: View {
    @EnvironmentObject var manager: SceneManager
    @State var showButton = false
    
    @AppStorage("showOnboarding") private var showOnboarding = true
    
    var body: some View {
        ZStack {
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
                    PrimaryButton(text: "COMEÇAR A FESTA",color: Color("red"), isActive: true, alt: true, type: [2])
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom, 40)
            .background(Color("red"))
            
            if(!showOnboarding && !showButton){
                RiveViewModel(fileName: "open").view()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .onAppear(){
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            showButton = true
                        }
                    }
            }
            
        }
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
