//
//  StartView.swift
//  Mini2
//
//  Created by Gabriel Henrique Kwiatkovski Godinho on 05/09/23.
//

import SwiftUI
import RiveRuntime

struct StartView: View {
    @EnvironmentObject var manager: Manager
    @State var showButton = false
    @State var showingModal = false
    @State var hideModal = false
    
    @AppStorage("showOnboarding") private var showOnboarding = true
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        Task {
                            await openSettings()
                        }
                    } label: {
                        Image("translate")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 28)
                            .bold()
                    }
                }
                .padding(.horizontal, 36)
                .padding(.top, 24)
                
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
                    PrimaryButton(text: "START THE PARTY", color: Color("red"), isActive: true, alt: true, type: [2])
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom, 40)
            .background(Color("red"))
            
//            if(!showOnboarding && !showButton) {
//                RiveViewModel(fileName: "open")
//                    .view()
//                    .scaledToFill()
//                    .ignoresSafeArea()
//                    .onAppear(){
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                            showButton = true
//                        }
//                    }
//            }
        }
        .fullScreenCover(isPresented: $showOnboarding) {
            ZStack {
                OnboardingView(showOnboarding: $showOnboarding)
            }
            
        }
    }
    
    func openSettings() async {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            do {
                try await UIApplication.shared.open(url)
            } catch {
                print("Error opening settings: \(error)")
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
