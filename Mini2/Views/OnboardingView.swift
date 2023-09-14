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
                Subtitle(text: "Primeiro")
                Title1(text: "REÚNA SEUS AMIGOS")
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
        .padding(.horizontal, 40)
    }
}

struct OnboardingView2: View {
    @Binding var showOnboarding: Bool
    var body: some View {
        VStack {

            Subtitle(text: "Então você pode")
            Title1(text: "ESCOLHER O JOGO")
            Subtitle(text: "e se divertir usando ferramentas para ajudar na sua gameplay")
            
            Tip(icon: "timer", title: "Dica do Timer!", description: "Use o timer para a resposta final e deixe os nervos à flor-da-pele!")
            
            Tip(icon: "figure.run.square.stack.fill", title: "Torne seu grupo maior!", description: "Utilize o botão de jogadores para adicionar ou remover jogadores da rodada!")
            
            Spacer()
            
            Button {
                showOnboarding.toggle()
            } label: {
                PrimaryButton(text: "VAMOS!", color: Color("red"), isActive: true, alt: true, type: [2])
            }
            .padding(.bottom)
            
        }
        .padding(.horizontal, 40)
    }
}
