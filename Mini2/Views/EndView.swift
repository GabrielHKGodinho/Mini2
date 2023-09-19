//
//  FimView.swift
//  Mini2
//
//  Created by Murilo Correa Pasquim on 28/08/23.
//

import SwiftUI

struct EndView: View {
    @EnvironmentObject var manager: Manager
    @EnvironmentObject var repository: GameRepository
    @State private var showingModal = false
    @State private var hideModal = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            repository.games[repository.selectedGame].color
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Button {
                        withAnimation {
                            manager.animation = .move(edge: .leading)
                            manager.currentView = .GameView
                        }
                    } label: {
                        ReturnButtonLabel(text: "GAME")
                    }
                    Spacer()
                    Button {
                        showingModal.toggle()
                    } label: {
                        Image(systemName: "figure.run.square.stack.fill")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                    }
                }
                
                Title1(text: repository.games[repository.selectedGame].name.uppercased())
                    .fixedSize(horizontal: false, vertical: true)
                    .baselineOffset(-10)
                
                Tip(icon: "figure.run.square.stack.fill", title: "Make the party bigger!".localized(), description: "Use the player button to add or remove friends from the round.".localized())
                
                Spacer()
                
                HStack {
                    Image(repository.games[repository.selectedGame].endImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 240)
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
                
                VStack(alignment: .center, spacing: 0) {
                    Button {
                        withAnimation {
                            manager.animation = .move(edge: .trailing)
                            manager.currentView = .SelectKingView
                        }
                    } label: {
                        PrimaryButton(text: "PLAY AGAIN".localized(), color: repository.games[repository.selectedGame].color, alt: true, type: [2])
                    }
                    
                    Button {
                        withAnimation {
                            manager.animation = .move(edge: .trailing)
                            manager.currentView = .GameListView
                        }
                    } label: {
                        PrimaryButton(text: "CHOOSE ANOTHER".localized(), color: repository.games[repository.selectedGame].color, type: [2])
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 36)
            .padding(.vertical, 24)
            
            if showingModal {
                Color(.black)
                    .opacity(0.5)
                    .ignoresSafeArea()
                    .onTapGesture {
                        hideModal = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            showingModal = false
                            hideModal = false
                        }
                    }
                EditPlayerModal(showingModal: $showingModal, color: repository.games[repository.selectedGame].color) {
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
