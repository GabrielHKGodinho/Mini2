//
//  GameRepository.swift
//  Mini2
//
//  Created by Murilo Correa Pasquim on 29/08/23.
//

import Foundation

class GameRepository: ObservableObject {
    @Published var selectedGame: Int = 0
    var games: [Game] = [
        Game(name: "Como é o seu?", description: "Um jogo de descrições", instructions: ["O mestre escolhido ou sorteado deve se retirar do local ou tampar os ouvidos de modo a não ouvir a conversa dos outros jogadores.", "Os outros jogadores terão 1 a 2 minutos para decidir algo que todos têm em comum.", "Quando tiverem decidido, o jogador selecionado volta, e precisa fazer a pergunta “Como é o seu?” para cada jogador.", "Após todos os jogadores derem dicas, o player sorteado deve tentar adivinhar qual palavra foi escolhida."]),
        
        Game(name: "Diga o mesmo", description: "Jogo de equipes", instructions: ["O jogo precisa ser jogado em pares. O aplicativo dará um tema aleatório. Exemplo: \"Comida\"", "A primeira equipe tentará falar a mesma palavra relacionado ao tema. Exemplo: \"Frango\", \"Pão\"", "A segunda equipe deverá falar uma palavra que tenha a ver com as palavras ditas pela equipe anterior. Exemplo: \"Sanduíche\", \"Lanche\""]),
        
        Game(name: "Top 10", description: "Jogo com mestre", instructions: ["O mestre terá acesso a uma lista de Top 10 de algum tema específico.", "Cada jogador deverá falar algum item que ele acredita estar na lista.", "Os outros jogadores podem duvidar se esse item está na lista ou não. Caso esteja, o jogador que duvidou é eliminado. Caso não esteja, o jogador que foi desafiado é eliminado.", "Se ninguém duvidar, o próximo jogador continua o jogo normalmente."]),
        
        Game(name: "Acerte o significado", description: "Jogo com dicionário", instructions: ["Um dos jogadores é selecionado para ser o mestre e uma palavra provavelmente desconhecida será selecionada pelo aplicativo", "Cada jogador deverá escrever um significado convincente para a palavra", "Após isso, o mestre irá ler todos os significados criados junto com o significado verdadeiro. Os jogadores devem tentar adivinhar qual é o correto."]),
        
        Game(name: "Medusa", description: "Jogo de sorte (melhor com mais pessoas)", instructions: ["Os jogadores fecharão os olhos e ao ouvir a notificação do timer deverão abrir os olhos olhando diretamente para algum amigo.", "Aqueles que tiverem se olhando serão eliminados pela “Medusa” e ganha aquele que sobrar no final."]),
        
        Game(name: "Jogo das 3 pistas", description: "Jogo de equipes", instructions: ["O jogo deve ser jogado em duas equipes e com um jogador como mestre.", "O mestre lerá uma dica relacionada à palavra secreta e cada uma das equipes deve tentar adivinhar qual é a palavra.", "Após as duas equipes tentarem adivinhar, o mestre lerá outra dica e o processo é repetido até que as 3 dicas tenham sido lidas. A primeira equipe que acertar a palavra ganha."])
    ]
}
