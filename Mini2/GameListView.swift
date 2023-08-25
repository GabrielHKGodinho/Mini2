//
//  GameListView.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 25/08/23.
//

import SwiftUI

struct GameListView: View {
    @State var categories = [Category(name: "Singleplayer"), Category(name: "Multiplayer"), Category(name: "Improviso"), Category(name: "Mímica")]
    @State var selectedCategories = [Category]()
    @State var games = [Game(name: "Jogo 1", description: "Teste", categories: [Category(name: "Singleplayer")])]
    
    var body: some View {
        VStack(spacing: 16) {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(categories.indices) { i in
                        Text(categories[i].name)
                            .padding(.horizontal, 8)
                            .foregroundColor(.white)
                            .background {
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(selectedCategories.contains(categories[i]) ? .black : .gray)
                            }
                            .onTapGesture {
                                if let index = selectedCategories.firstIndex(of: categories[i]) {
                                    selectedCategories.remove(at: index)
                                } else {
                                    selectedCategories.append(categories[i])
                                }
                            }
                    }
                }
            }
            .scrollIndicators(.hidden)

            ForEach(games) { game in
                if includesCategories(game) {
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
            }
            Spacer()
            
        }
        .padding(16)
        .onAppear {
            games.first!.categories.append(categories.first!)
        }
    }
    
    func includesCategories(_ game: Game) -> Bool {
        for category in game.categories {
            if selectedCategories.contains(category) {
                return true
            }
        }
        return false
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}
