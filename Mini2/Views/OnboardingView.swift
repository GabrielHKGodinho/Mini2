//
//  OnboardingView.swift
//  Mini2
//
//  Created by Isabela Bastos Jastrombek on 12/09/23.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var showOnboarding: Bool
    @State private var selection = 0
    @State private var numberOfTabs = 2
    var body: some View {
        VStack {
            
            VStack {
                TabView(selection: $selection) {
                    OnboardingView1().tag(0)
                    
                    OnboardingView2(showOnboarding: $showOnboarding).tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .padding(.top, 60)
            
            CustomTabViewIndicator(selection: $selection, numberOfTabs: numberOfTabs, darkMode: false)
                .padding(.horizontal, 40)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.bottom, 24)
        .background(Color("red"))
    }
}

struct OnboardingView1: View {
    var body: some View {
        VStack(spacing: 16) {
            
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 219, height: 114)
            }
            .frame(height: 190)
            
            
            VStack(alignment: .leading) {
                Subtitle(text: "First of all")
                Title1(text: "GET YOUR FRIENDS TOGETHER")
                    .frame(maxWidth: 280)
                    .baselineOffset(-8)
                    .overlay {
                        Image("cherries")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240)
                            .offset(x: 90, y: -20)
                    }
            }
            .padding(.top, 24)
            
            Spacer()
            Spacer()
        }
        .padding(.horizontal, 36)
    }
}

struct OnboardingView2: View {
    @Binding var showOnboarding: Bool
    var body: some View {
        VStack(spacing: 16) {
            Subtitle(text: "Then you can")
            Title1(text: "SELECT THE GAME")
            Subtitle(text: "and have fun using tools to help your gameplay")
            
            Tip(icon: "timer", title: "Timer tip!", description: "Use the timer for the final answer and let the nerves run high!")
            Tip(icon: "figure.run.square.stack.fill", title: "Make the party bigger!", description: "Use the player button to add or remove friends from the round.")
            
            Spacer()
            
            Button {
                showOnboarding.toggle()
            } label: {
                PrimaryButton(text: "LET'S GO!", color: Color("red"), isActive: true, alt: true, type: [2])
            }
            .padding(.bottom)
            
        }
        .padding(.horizontal, 36)
    }
}
