//
//  ChangeLanguageModal.swift
//  DRIP
//
//  Created by Eduardo Stefanel Paludo on 20/09/23.
//

import SwiftUI

struct Language: Identifiable {
    let id = UUID()
    let name: String
    let code: String
}

struct ChangeLanguageModal: View {
    @EnvironmentObject var manager: Manager
    @State private var showingAlert = false
    
    let color = Color("red")
    let languages: [Language] = [Language(name: "English".localized(), code: "en"), Language(name: "Portuguese".localized(), code: "pt-BR")]
    
    var onCloseButtonTap: () -> Void
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(spacing: 24) {
                HStack {
                    Spacer()
                    Button {
                        onCloseButtonTap()
                    } label: {
                        Image(systemName: "xmark.circle")
                            .foregroundColor(.white)
                            .font(.title)
                    }
                }
                
                Title1(text: "SET THE LANGUAGE")
                
                VStack {
                    ForEach(languages) { lang in
                        Button {
                            UserDefaults.standard.set(lang.code, forKey: "language")
                            
                            manager.lang = lang.code
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 100)
                                    .foregroundColor(Color("grayOpacity"))
                                    .frame(maxWidth: .infinity, maxHeight: 55)
                                RoundedRectangle(cornerRadius: 100)
                                    .stroke(lineWidth: manager.lang == lang.code ? 3 : 1)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, maxHeight: 55)
                                HStack(alignment: .center, spacing: 9) {
                                    Image(lang.code)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(.white)
                                    Text(lang.name)
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                            }
                        }
                        .alert("Restart the app for changes to take effect", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
                        .padding(.horizontal, 4)
                        .padding(.top, 2)
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 24)
            .background(color)
            //.frame(height: 400, alignment: .bottom)
        }
    }
}

struct ChangeLanguageModal_Previews: PreviewProvider {
    static var previews: some View {
        let manager = Manager()
        ChangeLanguageModal() {
            
        }
        .environmentObject(manager)
    }
}
