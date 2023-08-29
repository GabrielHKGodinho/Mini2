//
//  RulesAndInfoView.swift
//  Mini2
//
//  Created by Isabela Bastos Jastrombek on 24/08/23.
//

import SwiftUI

struct RulesAndInfoView: View {
    @State private var selection = 0
    private let numberOfTabs = 5
    var rules: [Color] = [.blue, .green, .red, .yellow, .orange]
    @Binding var tela: Tela
    
    var body: some View {
        VStack {
            Text("Game Title Rules")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.vertical, 40)
            
            
            VStack {
                TabView(selection: $selection) {
                    ForEach(rules.indices,id: \.self) {index in
                        VStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(rules[index])
                                        .padding(20)
                                        .tag(index)
                                }
                                .padding(.horizontal, 32)
                                .padding(.bottom, 20)
                        }
                    }

                }
                .shadow(color: .black.opacity(0.2), radius: 6, x: 10, y: 10)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack(spacing: 8) {
                    ForEach(0..<numberOfTabs, id: \.self) { index in
                        Circle()
                            .frame(width: 15, height: 15)
                            .foregroundColor(selection == index ? .white : .white.opacity(0.3))
                            .animation(.easeInOut(duration: 0.2))
                            .padding(.horizontal, 2)
                    }
                }
            }
            .preferredColorScheme(.dark)
            
            
            Button {
                tela = .selectKing
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .frame(height: 70)
                        .padding(32)
                    
                    Text("Play")
                        .font(.title)
                }
            }
            .shadow(color: .black.opacity(0.2), radius: 6, x: 10, y: 10)
            
        }
        .preferredColorScheme(.dark)
        .background(.gray)
        
    }
}

struct RulesAndInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RulesAndInfoView(tela: .constant(.rules))
    }
}
