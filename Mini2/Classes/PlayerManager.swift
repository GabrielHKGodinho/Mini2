//
//  PlayerManager.swift
//  Mini2
//
//  Created by Gabriel Henrique Kwiatkovski Godinho on 30/08/23.
//

import Foundation

class PlayerManager: ObservableObject {
    static let icons = ["face1-pink", "face1-yellow", "face2-pink", "face2-yellow", "face3-pink", "face3-yellow", "face4-pink", "face4-yellow"].shuffled()
    static var currentIconIndex = 0
    
    static let instance = PlayerManager()
    
    private static var players: [Player] = []
    
    private init(){}
    
    static func addPlayer(player: Player) {
        players.append(player)
    }
    
    static func removePlayer(index: Int) {
        if index >= players.count{
            return
        } else {
            players.remove(at: index)
        }
    }
    
    static func getRandomIcon() -> String {
        let icon = icons[currentIconIndex]
        currentIconIndex = (currentIconIndex + 1) % icons.count
        return icon
    }
    
    static func getPlayers() -> [Player] {
        return players
    }
    
    static func getNumberOfPlayers() -> Int {
        return players.count
    }
    
    static func getPlayersNames() -> [String] {
        var names: [String] = []
        if getNumberOfPlayers() > 0{
            for(player) in players{
                names.append(player.name)
            }
            return names
        }else{
            return names
        }
    }
    
    static func getLastPlayerName() -> String {
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
