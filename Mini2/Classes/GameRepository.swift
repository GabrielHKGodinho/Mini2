//
//  GameRepository.swift
//  Mini2
//
//  Created by Murilo Correa Pasquim on 29/08/23.
//

import Foundation

class GameRepository: ObservableObject {
    var games: [Game] = [
        Game(name: "How's yours", description: "Um jogador será sorteado pela roleta.", instructions: ["Esse jogador deverá se retirar do local ou tampar os ouvidos de modo a não ouvir a conversa dos outros jogadores.", "Os outros jogadores terão 1˜2 minutos para decidir algo que todos presentes têm em comum e escrever a palavra que escolheram.", "Quando o timer acabar o jogador selecionado volta, e precisa fazer a pergunta “Como é o seu?” para cada jogador em 10 segundos que devem dar apenas uma dica", "Após todos os jogadores derem dicas, o player sorteado deve escrever qual palavra foi escolhida."]),
        
        Game(name: "Say the same", description: "Montar equipes", instructions: ["O jogo precisa ser jogado em pares. O aplicativo dará um tema aleatório: “Comida” e cada a primeira equipe tentará falar a mesma palavra relacionado ao tema.", "'Frango” “Pão", "A segunda equipe deverá falar uma palavra que tenha a ver com as palavras ditas pela equipe anterior.", "“Sanduíche” “Lanche”"])
    ]
}
