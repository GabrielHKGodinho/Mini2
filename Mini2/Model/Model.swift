import SwiftUI

    struct Jogos: Identifiable, Hashable {

        let id = UUID()
        let instrucoes: String?
        let tarefas: String?
        let desafio: String?


        
        static var todasJogos = Jogos.populateJogos()

        static func populateJogos() -> [Jogos] {
            var jogo: [Jogos] = []
             
            var HowYours = Jogos(
                                instrucoes: "Esse jogador deverá se retirar do local ou tampar os ouvidos de modo a não ouvir a conversa dos outros jogadores. \nOs outros jogadores terão 1˜2 minutos para decidir algo que todos presentes têm em comum e escrever a palavra que escolheram.",
                                 tarefas: "Quando o timer acabar o jogador selecionado volta, e precisa fazer a pergunta “Como é o seu?” para cada jogador em 10 segundos que devem dar apenas uma dica",
                                 desafio: "Após todos os jogadores derem dicas, o player sorteado deve escrever qual palavra foi escolhida."
            )

            jogo.append(HowYours)
            
            return jogo


        }
    }

