//
//  FimView.swift
//  Mini2
//
//  Created by Murilo Correa Pasquim on 28/08/23.
//

import SwiftUI

struct EndView: View {
    @EnvironmentObject var manager: SceneManager
    @EnvironmentObject var repository: GameRepository
    @State private var showingModal = false
    @State private var hideModal = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.black)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 24) {
                HStack {
                    ReturnButton(manager: _manager, text: "GAME", path: .GameView)
                    Spacer()
                    Button {
                        showingModal.toggle()
                    } label: {
                        Image(systemName: "figure.run.square.stack.fill")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                }
                
                Text(repository.games[repository.selectedGame].name.uppercased())
                    .foregroundColor(.white)
                    .font(Font.custom("Grandstander-Bold", size: 64))
                    .padding(.bottom, -8)
                    .baselineOffset(-8)
                
                Tip(icon: "figure.run.square.stack.fill", title: "Torne seu grupo maior!", description: "Utilize o botão de jogadores para adicionar ou retirar amigos da rodada!")
                
                Spacer()
                
                VStack(alignment: .center, spacing: 0) {
                    Button {
                        manager.currentView = .RulesView
                    } label: {
                        PrimaryButton(text: "PLAY AGAIN", alt: true)
                    }
                    
                    Button {
                        manager.currentView = .GameListView
                    } label: {
                        PrimaryButton(text: "GIVE ME NEXT")
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 36)
            .padding(.vertical, 24)
            
            if showingModal {
                Color(.black)
                    .opacity(0.3)
                    .onTapGesture {
                        hideModal = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            showingModal = false
                            hideModal = false
                        }
                    }
                EditPlayerModal(showingModal: $showingModal) {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        hideModal = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        showingModal = false
                        hideModal = false
                    }
                }
                .transition(.move(edge: .bottom))
                .animation(.linear(duration: 0.2))
                .offset(y: hideModal ? UIScreen.main.bounds.height : 0)
            }
        }
    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        let repo = GameRepository()
        EndView()
            .environmentObject(repo)
    }
}
