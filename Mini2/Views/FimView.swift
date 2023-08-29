//
//  FimView.swift
//  Mini2
//
//  Created by Murilo Correa Pasquim on 28/08/23.
//

import SwiftUI

struct FimView: View {
    @EnvironmentObject var manager: SceneManager
    
    var body: some View {
        VStack{
            
            Spacer()
            
            Button {
                manager.currentView = .RulesView
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .frame(height: 70)
                    Text("Play again")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                }
            }
            
            Button {
                manager.currentView = .GameListView
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .frame(height: 70)
                    Text("Next game")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                }
            }
            
        } .padding(32)
            .preferredColorScheme(.dark)
            .background(.gray)

    }
}

struct FimView_Previews: PreviewProvider {
    static var previews: some View {
        FimView()
    }
}