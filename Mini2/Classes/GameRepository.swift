//
//  GameRepository.swift
//  Mini2
//
//  Created by Murilo Correa Pasquim on 29/08/23.
//

import Foundation
import SwiftUI

class GameRepository: ObservableObject {
    @Published var selectedGame: Int = 2
    var games: [Game] = [
         Game(name: "How's yours?", icon: "tshirt.fill", color: Color("purple"), endImage: "hows-yours-end", description: "One selected player will have to find what is common between the players asking them \"How's yours?\"", instructions: [("The player chosen will need to leave or cover their ears to not hear the other players discussion", "hows-yours1"), ("The others players will have some time to decide something they have in common", "hows-yours2"), ("When decided, the selected player will have to ask to other players \"How’s yours?\"", "hows-yours3"), ("After all players have answered, the selected player must try to guess which word was chosen", "hows-yours4")]),
    
         Game(name: "Top 10", icon: "10.circle.fill", color: Color("green"), endImage: "top10-end", description: "Say what you think is part of the Top 10 while doubting your friends", instructions: [("A player will be selected as master and will have access to a list with the Top 10 about some topic", "top10-1"), ("Each player will have to say something that they think will be on the list", "top10-2"), ("The other players can doubt whether the word said is on the list or not. If it is, the player that doubted leaves the game. If not, the player that was challenged leaves the game.", "top10-3")]),
        
         Game(name: "Beeeengo!", icon: "123.rectangle.fill", color: Color("blue"), endImage: "beeeengo-end", description: "The master will get a number out of 0 to 10, and the others players must find out which number it is through some questions", instructions: [("The selected player will receive a random number from 0 to 10", "beeeengo1"), ("The other players' mission is to discover this note by asking questions to the leader", "beeeengo2"), ("Each player can ask the master a question, e.g.: “A food” and must be answered with a food that represents the number drawn", "beeeengo3")]),
    
         Game(name: "You have 20s", icon: "clock.circle", color: Color("pink"), endImage: "you-have-20s-end", description: "Test your skills and check if you have the ability to say in 20 seconds the maximum number of word related to a theme", instructions: [("A theme will be drawn and the players will have say how many words about the topic they can quote in 20 seconds", "vc-tem-20s1"), ("If the theme is \"soccer teams\", each player say \"I can say 5 teams\", \"I can say 8 teams\", always increasing the number", "vc-tem-20s2"), ("When no one else wants to increase the number, the person who said the most starts to say the words. If they say less words than the agreed, they lose.", "vc-tem-20s3")])
        
//        Game(name: "Diga o mesmo", description: "Jogo de equipes", instructions: ["O jogo precisa ser jogado em pares. O aplicativo dará um tema aleatório. Exemplo: \"Comida\"", "A primeira equipe tentará falar a mesma palavra relacionado ao tema. Exemplo: \"Frango\", \"Pão\"", "A segunda equipe deverá falar uma palavra que tenha a ver com as palavras ditas pela equipe anterior. Exemplo: \"Sanduíche\", \"Lanche\""]),
        
//        Game(name: "Acerte o significado", description: "Jogo com dicionário", instructions: ["Um dos jogadores é selecionado para ser o mestre e uma palavra provavelmente desconhecida será selecionada pelo aplicativo", "Cada jogador deverá escrever um significado convincente para a palavra", "Após isso, o mestre irá ler todos os significados criados junto com o significado verdadeiro. Os jogadores devem tentar adivinhar qual é o correto."]),
//
//        Game(name: "Medusa", description: "Jogo de sorte (melhor com mais pessoas)", instructions: ["Os jogadores fecharão os olhos e ao ouvir a notificação do timer deverão abrir os olhos olhando diretamente para algum amigo.", "Aqueles que tiverem se olhando serão eliminados pela “Medusa” e ganha aquele que sobrar no final."]),
//
//        Game(name: "Jogo das 3 pistas", description: "Jogo de equipes", instructions: ["O jogo deve ser jogado em duas equipes e com um jogador como mestre.", "O mestre lerá uma dica relacionada à palavra secreta e cada uma das equipes deve tentar adivinhar qual é a palavra.", "Após as duas equipes tentarem adivinhar, o mestre lerá outra dica e o processo é repetido até que as 3 dicas tenham sido lidas. A primeira equipe que acertar a palavra ganha."])
         
    ]
}
