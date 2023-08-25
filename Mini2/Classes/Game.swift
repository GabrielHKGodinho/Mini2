//
//  Game.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 24/08/23.
//

import Foundation

class Game: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var icon: String
    
    let instructions: [String]
    
    init(name: String, description: String, icon: String = "", instructions: [String]) {
        self.name = name
        self.description = description
        self.icon = icon
        self.instructions = instructions
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

