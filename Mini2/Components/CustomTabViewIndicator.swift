//
//  CustomTabViewIndicator.swift
//  Mini2
//
//  Created by Isabela Bastos Jastrombek on 05/09/23.
//

import SwiftUI

struct CustomTabViewIndicator: View {
    @Binding var selection : Int
    @State var numberOfTabs : Int
    @State var darkMode : Bool
    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<numberOfTabs, id: \.self) { index in
                RoundedRectangle(cornerRadius: 2)
                    .frame(height: 5)
                    .foregroundColor(selection == index ? Color(uiColor: .systemGray) : Color(uiColor: .systemGray).opacity(0.3))
                    .animation(.easeInOut(duration: 0.2))
                    .padding(.horizontal, 2)
            }
        }
        .preferredColorScheme(darkMode ? .dark : .light)
        .padding(.horizontal, 32)
        .padding(.bottom, 48)
    }
}

struct CustomTabViewIndicatorDark_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabViewIndicator(selection: .constant(1), numberOfTabs: 4, darkMode: false)
    }
}

