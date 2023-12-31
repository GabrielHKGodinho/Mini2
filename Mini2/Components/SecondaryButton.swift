//
//  SecondaryButton.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 05/09/23.
//

import SwiftUI

struct SecondaryButton: View {
    var icon: String?
    let text: String
    var type: [Int]? = [0, 1, 2]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 100)
                .stroke(lineWidth: 1)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 44)
                .background {
                    switch type {
                    case [0]:
                        VStack {
                            RoundedRectangle(cornerRadius: 100)
                                .foregroundColor(.white)
                                .opacity(0.3)
                        }
                            .shadow(color: .black.opacity(0.55), radius: 6, x: 1, y: 8)
                        
                    case [1]:
                        VStack {
                            RoundedRectangle(cornerRadius: 100)
                                .foregroundColor(.white)
                                .opacity(0.3)
                        }
                            .shadow(color: .black.opacity(0.4), radius: 6, x: 1, y: 8)
                        
                    case [2]:
                        VStack {
                            RoundedRectangle(cornerRadius: 100)
                                .foregroundColor(.white)
                                .opacity(0.3)
                        }
                            .shadow(color: .black.opacity(0.2), radius: 6, x: 1, y: 8)
                        
                    default:
                        VStack {
                            RoundedRectangle(cornerRadius: 100)
                                .foregroundColor(.white)
                                .opacity(0.3)
                        }
                    }
                    
                }
            HStack {
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.title2)
                        .foregroundColor(.white)
                }
                Text(text.localized())
                    .foregroundColor(.white)
                    .font(.title2)
            }
        }
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton(icon: "plus", text: "Add a buddy", type: [0])
    }
}
