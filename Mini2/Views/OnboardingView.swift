//
//  OnboardingView.swift
//  Mini2
//
//  Created by Isabela Bastos Jastrombek on 12/09/23.
//

import SwiftUI

struct OnboardingView: View {
    @State private var selection = 0
    @State private var numberOfTabs = 2
    @State var viewsOnboarding = [OnboardingView1().self, OnboardingView2().self] as [Any]
    var body: some View {
        VStack {
            
            VStack {
                TabView(selection: $selection) {
                    OnboardingView1().tag(0)
                    
                    OnboardingView2().tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            
            CustomTabViewIndicator(selection: $selection, numberOfTabs: numberOfTabs, darkMode: false)
                .padding(.horizontal, 40)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.vertical, 24)
        .background(Color("red"))
    }
}

struct OnboardingView1: View {
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 291, height: 151)
            
            
            
            Subtitle(text: "Primeiro")
            Title1(text: "REÚNA SEUS AMIGOS")
                .overlay {
                    Image("cherries")
                        .resizable()
                        .frame(width: 208, height: 230)
                        .scaledToFit()
                        .offset(x: 70, y: -45)
                }
        }
        .padding(.horizontal, 40)
    }
}

struct OnboardingView2: View {
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 291, height: 151)
            
            
            
            Subtitle(text: "Primeiro")
            Title1(text: "REÚNA SEUS AMIGOS")
                .overlay {
                    Image("cherries")
                        .resizable()
                        .frame(width: 208, height: 230)
                        .scaledToFit()
                        .offset(x: 70, y: -45)
                }
        }
        .padding(.horizontal, 40)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
