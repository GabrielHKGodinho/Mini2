//
//  EditPlayerModal.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 11/09/23.
//

import SwiftUI

struct EditPlayerModal: View {
    @State var players = PlayerManager.getPlayers()
    @State var playersNames: [String] = PlayerManager.getPlayersNames()
    @State var name: String = "Player \(PlayerManager.getNumberOfPlayers() + 1)"
    
    @Binding var showingModal: Bool
    let color: Color
    
    var onCloseButtonTap: () -> Void
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Spacer()
                    Button {
                        onCloseButtonTap()
                    } label: {
                        Image(systemName: "x.circle")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal, 36)
                
                Title2(text: "JUNTE A GALERA")
                    .padding(.horizontal, 36)
                
                Spacer()
                
                PlayerList(isActive: .constant(false), isFocused: .constant(false))
            }
            .padding(.vertical, 24)
            .frame(minHeight: 540, maxHeight: 540, alignment: .bottom)
            .background(.green)
        }
    }
}

struct EditPlayerModal_Previews: PreviewProvider {
    static var previews: some View {
        EditPlayerModal(showingModal: .constant(false), color: Color("blue")) {
            
        }
    }
}
