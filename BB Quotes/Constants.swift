//
//  Constants.swift
//  BB Quotes
//
//  Created by Apple on 21/04/24.
//

import Foundation

enum Constants {
    static let bbName = "Breaking Bad"
    static let bcsName = "Better Call Saul"
    
    static let previewCharacter: Character = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let data = try! Data(contentsOf: Bundle.main.url(forResource: "samplecharacter", withExtension: "json")!)
        return try! decoder.decode([Character].self, from: data).first!
    }()
}
