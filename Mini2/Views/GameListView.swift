//
//  GameListView.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 25/08/23.
//

import SwiftUI

struct GameListView: View {
    @EnvironmentObject var repository: GameRepository
    @EnvironmentObject var manager: SceneManager
    
    var body: some View {
        VStack(spacing: 16) {
            
            VStack {
                ZStack {
                    Text("Select a game")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.vertical, 40)
                    
                    HStack {
                        Button {
                            manager.currentView = .AddPlayerView
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.title)
                                .bold()
                        }
                        
                        Spacer()
                    }
                }
                
                ForEach(0..<repository.games.count, id: \.self) { i in
                    HStack {
                        Text(repository.games[i].name)
                            .foregroundColor(.white)
                        Text(repository.games[i].description)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 16)
                    }
                    .onTapGesture {
                        manager.currentView = .RulesView
                        repository.selectedGame = i
                    }
                }
                Spacer()
            }
            .padding(32)
        }
        .background(Color(uiColor: .systemGray4))
        
    }
}

//struct GameListView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameListView()
//    }
//}
