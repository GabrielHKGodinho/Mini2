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
        Game(name: "Como é o seu?", icon: "tshirt.fill", color: Color("purple"), description: "Nesse jogo uma pessoa precisará descobrir o que os outros têm em comum perguntando \"Como é o seu?\"", instructions: [("O mestre escolhido ou sorteado deve se retirar do local ou tampar os ouvidos de modo a não ouvir a conversa dos outros jogadores.", "hows-yours1"), ("Os outros jogadores terão 1 a 2 minutos para decidir algo que todos têm em comum.", "hows-yours2"), ("Quando tiverem decidido, o jogador selecionado volta, e precisa fazer a pergunta “Como é o seu?” para cada jogador.", "hows-yours3"), ("Após todos os jogadores derem dicas, o player sorteado deve tentar adivinhar qual palavra foi escolhida.", "hows-yours4")]),
        

        Game(name: "Top 10", icon: "10.circle.fill", color: Color("green"), description: "Diga o que acha fazer parte do Top 10 enquanto duvida das respostas de seus amigos", instructions: [("O mestre terá acesso a uma lista de Top 10 de algum tema específico.", ""), ("Cada jogador deverá falar algum item que ele acredita estar na lista.", ""), ("Os outros jogadores podem duvidar se esse item está na lista ou não. Caso esteja, o jogador que duvidou é eliminado. Caso não esteja, o jogador que foi desafiado é eliminado.", ""), ("Se ninguém duvidar, o próximo jogador continua o jogo normalmente.", "")]),
        
        

        
//        Game(name: "Diga o mesmo", description: "Jogo de equipes", instructions: ["O jogo precisa ser jogado em pares. O aplicativo dará um tema aleatório. Exemplo: \"Comida\"", "A primeira equipe tentará falar a mesma palavra relacionado ao tema. Exemplo: \"Frango\", \"Pão\"", "A segunda equipe deverá falar uma palavra que tenha a ver com as palavras ditas pela equipe anterior. Exemplo: \"Sanduíche\", \"Lanche\""]),
        
        Game(name: "Beeeengo!", icon: "123.rectangle.fill", color: Color("blue"), description: "O número sorteado entre 0 e 10 para o jogador escolhido deverá ser descoberto pelos outros players a partir de perguntas", instructions: [("O jogador sorteado receberá uma nota de 0 a 10", "beeeengo1"), ("A missão dos demais jogadores é descobrir essa nota a partir de perguntas", "beeeengo2"), ("Cada jogador pode fazer uma pergunta para o mestre, ex?: \"Uma comida brasileira\" e deverá ser respondido com uma comida que represente a nota sorteada", "beeeengo3")]),
        
        Game(name: "Vc tem 20s", icon: "clock.circle", color: Color("pink"), description: "Teste sua capacidade e veja se você tem a habilidade de dizer em 20 segundos o máximo de palavras referente a um tema específico", instructions: [("Um tema será sorteado e cada jogador diz quantas palavras do tema consegue falar em 20 segundos", "vc-tem-20s1"), ("Se o tema for \"times de futebol”, cada jogador começa a falar \"eu falo 5 times”, \"eu falo 8”, sempre aumentando os números", "vc-tem-20s2"), ("Quando ninguém mais quiser aumentar o número, a pessoa que falou o maior inicia o timer e começa a falar as palavras, se ela falar menos do que ela se propôs, ela perde.", "vc-tem-20s3")])
        
//        Game(name: "Acerte o significado", description: "Jogo com dicionário", instructions: ["Um dos jogadores é selecionado para ser o mestre e uma palavra provavelmente desconhecida será selecionada pelo aplicativo", "Cada jogador deverá escrever um significado convincente para a palavra", "Após isso, o mestre irá ler todos os significados criados junto com o significado verdadeiro. Os jogadores devem tentar adivinhar qual é o correto."]),
//
//        Game(name: "Medusa", description: "Jogo de sorte (melhor com mais pessoas)", instructions: ["Os jogadores fecharão os olhos e ao ouvir a notificação do timer deverão abrir os olhos olhando diretamente para algum amigo.", "Aqueles que tiverem se olhando serão eliminados pela “Medusa” e ganha aquele que sobrar no final."]),
//
//        Game(name: "Jogo das 3 pistas", description: "Jogo de equipes", instructions: ["O jogo deve ser jogado em duas equipes e com um jogador como mestre.", "O mestre lerá uma dica relacionada à palavra secreta e cada uma das equipes deve tentar adivinhar qual é a palavra.", "Após as duas equipes tentarem adivinhar, o mestre lerá outra dica e o processo é repetido até que as 3 dicas tenham sido lidas. A primeira equipe que acertar a palavra ganha."])
    ]
}
