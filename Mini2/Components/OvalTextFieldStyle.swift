//
//  OvalTextFieldStyle.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 06/09/23.
//

import SwiftUI

struct SuperTextField: View {
    
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
                .foregroundColor(.black)
                .font(Font.custom("Grandstander-Bold", size: 32))
                .textFieldStyle(CustomTextFieldStyle())
        }
    }
}
