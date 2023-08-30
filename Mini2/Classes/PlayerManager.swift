//
//  PlayerManager.swift
//  Mini2
//
//  Created by Gabriel Henrique Kwiatkovski Godinho on 30/08/23.
//

import Foundation

class PlayerManager:ObservableObject {
    
    static let instance = PlayerManager()
    
    private static var players: [Player] = []
    
    private init(){}
    
    static func addPlayer(player: Player){
        players.append(player)
    }
    
    static func removePlayer(index: Int){
        if index >= players.count{
            return
        }else{
            players.remove(at: index)
        }
    }
    
    static func getPlayers()->[Player]{
        return players
    }
    
    static func getNumberOfPlayers()->Int{
        return players.count
    }
    
    static func getLastPlayerName()->String{
        if getNumberOfPlayers() > 0{
            return players.last!.name
        }else{
            return "None"
        }
    }
    
    static func setPlayerName(index: Int, name: String){
        players[index].name = name
    }
}
