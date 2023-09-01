//
//  Top10.swift
//  Mini2
//
//  Created by Eduardo Stefanel Paludo on 01/09/23.
//

import Foundation

struct Top10 {
    var theme: String
    var items: [String]
}

class Top10Repository: ObservableObject {
    static let list: [Top10] = [
        Top10(theme: "filmes de todos os tempos", items: [
            "O Poderoso Chefão",
            "O Poderoso Chefão - Parte II",
            "Um Sonho de Liberdade",
            "O Senhor dos Anéis: O Retorno do Rei",
            "A Lista de Schindler",
            "Pulp Fiction: Tempo de Violência",
            "O Império Contra-Ataca",
            "O Rei Leão",
            "Forrest Gump: O Contador de Histórias",
            "Titanic"
        ]),
        Top10(theme: "times de futebol brasileiros", items: [
            "Flamengo",
            "Corinthians",
            "Palmeiras",
            "São",
            "Santos",
            "Cruzeiro",
            "Grêmio",
            "Internacional",
            "Vasco",
            "Fluminense"
        ]),
        Top10(theme: "bandas de rock de todos os tempos", items: [
            "The Beatles",
            "Led Zeppelin",
            "Pink Floyd",
            "Queen",
            "Rolling Stones",
            "The Who",
            "U2",
            "Nirvana",
            "The Doors",
            "Guns N' Roses"
        ]),
        Top10(theme: "comidas brasileiras", items: [
            "Feijoada",
            "Acarajé",
            "Coxinha",
            "Moqueca",
            "Bobó de Camarão",
            "Pão de Queijo",
            "Feijão-Tropeiro",
            "Vatapá",
            "Tapioca",
            "Churrasco"
        ])
    ]
}
