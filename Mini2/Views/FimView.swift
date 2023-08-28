//
//  FimView.swift
//  Mini2
//
//  Created by Murilo Correa Pasquim on 28/08/23.
//

import SwiftUI

struct FimView: View {
    var body: some View {
        VStack{
            
            Spacer()
            
            Button {
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .frame(height: 70)
                    Text("Play again")
                        .font(.title)
                }
            }
            .shadow(color: .black.opacity(0.2), radius: 6, x: 10, y: 10)
            
            Button {
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .frame(height: 70)
                    Text("Next game")
                        .font(.title)
                }
            }
            .shadow(color: .black.opacity(0.2), radius: 6, x: 10, y: 10)
            
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
