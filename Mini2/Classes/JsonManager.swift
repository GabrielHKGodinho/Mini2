//
//  JsonManager.swift
//  Mini2
//
//  Created by Gabriel Henrique Kwiatkovski Godinho on 12/09/23.
//

import Foundation

class JsonManager: ObservableObject {
    static let instance = JsonManager()
    
    static let languageArray = UserDefaults.standard.object(forKey: "AppleLanguages") as? [String]
    
    private init(){}

    static func fillTop10() -> [Top10]{
        var language = languageArray?.first ?? "en"
        if (language != "pt-BR") {
            language = "en"
        }

        guard let sourcesURL = Bundle.main.url(forResource: "top10-\(language)", withExtension: "json") else {
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
    
    static func fill20sec() -> [String]{
        var language = languageArray?.first ?? "en"
        
        if (language != "pt-BR") {
            language = "en"
        }
        
        print(languageArray)
        print(language)
        
        guard let sourcesURL = Bundle.main.url(forResource: "youHave20s-\(language)", withExtension: "json") else {
            fatalError("Could not find top10.json\n")
        }
        
        guard let top10Data = try? Data(contentsOf: sourcesURL) else {
            fatalError("Could not convert data\n")
        }
        
        let decoder = JSONDecoder()
        guard let top10 = try? decoder.decode([String].self, from: top10Data) else{
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

