//
//  JsonManager.swift
//  Mini2
//
//  Created by Gabriel Henrique Kwiatkovski Godinho on 12/09/23.
//

import Foundation

class JsonManager: ObservableObject {
    static let instance = JsonManager()
    
    private init(){}

    static func fillTop10() -> [Top10]{
        
        guard let sourcesURL = Bundle.main.url(forResource: "top10", withExtension: "json") else {
            fatalError("Could not find top10.json\n")
        }
        
        guard let top10Data = try? Data(contentsOf: sourcesURL) else {
            fatalError("Could not convert data\n")
        }
        
        let decoder = JSONDecoder()
        guard let top10 = try? decoder.decode([Top10].self, from: top10Data) else{
            fatalError("Could not decode data\n")
        }
        print(top10)
        
        return top10;
    }
    
}

struct Top10: Decodable {
    var theme: String
    var items: [String]
}

