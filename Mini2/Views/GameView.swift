//
//  GameView.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 06/09/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var manager: SceneManager
    @EnvironmentObject var repository: GameRepository
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 24) {
                ReturnButton(manager: _manager, text: "RULES", path: .RulesView)
                
                Text(repository.games[repository.selectedGame].name.uppercased())
                    .foregroundColor(.white)
                    .font(Font.custom("Grandstander-Bold", size: 64))
                    .padding(.bottom, -8)
                
                Spacer()
                    
                VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Image(systemName: "timer")
                                .foregroundColor(.white)
                                .bold()
                            Text("Timer tip!")
                                .font(.body)
                                .bold()
                                .foregroundColor(.white)
                        }
                        Text("Use o timer para a resposta final e deixe os nervos à flor-da-pele!")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.bottom, 32)

                HStack(alignment: .center) {
                    Button {
                        manager.currentView = .EndGameView
                    } label: {
                        PrimaryButton(text: "FINISH GAME")
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(36)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let repository = GameRepository()
        GameView()
            .environmentObject(repository)
    }
}
