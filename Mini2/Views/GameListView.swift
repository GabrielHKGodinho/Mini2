//
//  GameListView.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 25/08/23.
//

import SwiftUI

struct GameListView: View {
    @StateObject var repository = GameRepository()
    
//    @State var categories = [Category(name: "Singleplayer"), Category(name: "Multiplayer"), Category(name: "Improviso"), Category(name: "Mímica")]
//    @State var selectedCategories = [Category]()
    
    var body: some View {
        VStack(spacing: 16) {
            ForEach(repository.games) { game in
                HStack {
                    Text(game.name)
                        .foregroundColor(.white)
                    Text(game.description)
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                }
            }
            .onTapGesture {
                
            }
            Spacer()
        }
        .padding(16)
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}
