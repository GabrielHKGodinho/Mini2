//
//  Game.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 24/08/23.
//

import Foundation
import SwiftUI

class Game: Identifiable {
    let id = UUID()
    var name: String
    var icon: String
    var color: Color
    var endImage: String
    var description: String
    let instructions: [(String, String)]
    
    init(name: String, icon: String = "shuffle.circle.fill", color: Color = .black, endImage: String, description: String, instructions: [(String, String)]) {
        self.name = name.localized()
        self.description = description.localized()
        self.icon = icon
        self.color = color
        self.endImage = endImage
        self.instructions = instructions.map { ($0.0.localized(), $0.1) }
    }
    
    // static var todasJogos = Game.populateJogos()

//    static func populateJogos() -> [Game] {
//        var jogo: [Game] = []
//
//        var HowYours = Game(
//                            Nome:"HowYours",
//                            instrucoes: "Esse jogador deverá se retirar do local ou tampar os ouvidos de modo a não ouvir a conversa dos outros jogadores. \nOs outros jogadores terão 1˜2 minutos para decidir algo que todos presentes têm em comum e escrever a palavra que escolheram.",
//                             tarefas: "Quando o timer acabar o jogador selecionado volta, e precisa fazer a pergunta “Como é o seu?” para cada jogador em 10 segundos que devem dar apenas uma dica",
//                             desafio: "Após todos os jogadores derem dicas, o player sorteado deve escrever qual palavra foi escolhida."
//        )
//
//        jogo.append(HowYours)
//
//        }
}

